# georgsold_infra
## Обязательные параметры:

``
testapp_IP = 35.205.240.105
testapp_port = 9292

bastion_IP = 35.205.124.119
someinternalhost_IP = 10.132.0.3

``
## Команды gcloud:
### Создание ВМ с использованием startup_script.sh
``
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=./startup_script.sh
``
### Создание ВМ с использованием startup-script-url
``
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script-url=https://storage.cloud.google.com/geo_url_test/startup_script.sh?_ga=2.253925646.-769518993.1552316299
``
### Создание правила доступа для ВМ
``
gcloud compute firewall-rules create  default-puma-service \
    --network default \
    --action allow \
    --direction ingress \
    --rules tcp:9292 \
    --source-ranges 0.0.0.0/0 \
    --priority 1000 \
    --target-tags puma-server
``
## Подключение к bastion:

ssh -i ~/.ssh/geo geo@35.205.124.119

## Подключение к someinternalhost одной командой:

ssh -t -i ~/.ssh/geo -A geo@35.205.124.119 ssh 10.132.0.3

## Подключение при помощи команды вида ssh someinternalhost:

Необходимо создать alias в ~/.ssh/config вида:

*****
``
host *
ForwardAgent yes

host bastion
HostName 35.205.124.119
User geo
IdentityFile ~/.ssh/geo.pub

Host someinternalhost
HostName 10.132.0.3
User geo
ProxyCommand ssh bastion nc %h %p

``
*****

Сохраняем, выполняем команду ssh someinternalhost и попадаем на someinternalhost через  bastion

## Дополнительное задание:

Добавлен сертификат https https://35.205.124.119.xip.io/
