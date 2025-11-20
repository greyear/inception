
FROM debian:latest
#официальный образ Debian Linux
RUN apt update && apt upgrade && apt install -y nginx
# обновляем список пакетов, обновляем установленные пакеты и устанавливаем nginx со флагом -y (автоматически отвечать "да" на запросы)
CMD ["nginx", "-g", "daemon off;"]
# запускаем nginx в фореграунд режиме (иначе контейнер сразу завершится)