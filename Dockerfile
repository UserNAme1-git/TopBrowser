# Используем официальный .NET SDK для сборки
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Копируем все файлы проекта
COPY . ./

# Публикуем проект в /out
RUN dotnet publish -c Release -o out

# Используем минимальный рантайм-образ
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .

# Запускаем приложение
ENTRYPOINT ["dotnet", "TBSite.dll"]
