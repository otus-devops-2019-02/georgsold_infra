
# georgsold_infra
georgsold Infra repository

bastion_IP = 35.205.124.119
someinternalhost_IP = 10.132.0.3

# Подключение к bastion:

# ssh -i ~/.ssh/geo geo@35.205.124.119

# Подключение к someinternalhost одной командой:

# ssh -t -i ~/.ssh/geo -A geo@35.205.124.119 ssh 10.132.0.3

# Подключение при помощи команды вида ssh someinternalhost:
# Необходимо создать alias в ~/.ssh/config вида:

# host *
# ForwardAgent yes

# host bastion
# HostName 35.205.124.119
# User geo
# IdentityFile ~/.ssh/geo.pub

# Host someinternalhost
# HostName 10.132.0.3
# User geo
# ProxyCommand ssh bastion nc %h %p

# Сохраняем, выполняем команду ssh someinternalhost и попадаем на someinternalhost через  bastion

# Дополнительное задание:
# Добавлен сертификат https https://35.205.124.119.xip.io/
