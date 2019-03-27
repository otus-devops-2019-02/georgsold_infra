# georgsold_infra
## Обязательные параметры:

```

testapp_IP = 35.233.127.139
testapp_port = 9292

bastion_IP = 35.205.124.119
someinternalhost_IP = 10.132.0.3

```

## Сделано:
1. Создан шаблон ubuntu16.json.
2. Созданы шаблоны пользовательских переменных variables.json (добавлен в gitignore) и variable.json.example (содержит случайные данные).
3. Создан шаблон immutable.json (часть переменных в variables.json). Добален файл описания устанавливаемого сервиса puma.service.
4. Все шаблоны проверены командой:

```
packer validate -var-file variables.json <имя шаблона>
```
5. Созданы образы ВМ на базе ранее созданных шаблонов:

```
packer build -var-file variables.json ubuntu16.json
```
6. Добавлен скрипт create-reddit-vm.sh для создания ВМ с использованием команды gcloud:

```
gcloud compute instances create reddit-app\
  --image-family reddit-full \
  --tags puma-server \
  --zone=europe-west1-d \
  --restart-on-failure
```

7. Проверено на работоспособность посредством запуска create-reddit-vm.sh.
