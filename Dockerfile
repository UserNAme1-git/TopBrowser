# Сборка приложения
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Копируем всё
COPY . ./

# Публикуем проект
RUN dotnet publish -c Release -o out

# Минимальный рантайм для запуска
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Копируем собранное приложение
COPY --from=build /app/out .

# Запуск сайта
ENTRYPOINT ["dotnet", "TBSite.dll"]
