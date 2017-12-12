Образ создается на основе официального образа от centos для systemd. Этот образ так же будет в моем репозитории.

Команда для билда контейнера:
docker build --rm -t local/c7-systemd-zabbix .

Команда для запуска контейнера:
docker run -ti -v /sys/fs/cgroup:/sys/fs/cgroup:ro --name=zabbix -p 80:80 -d local/c7-systemd-zabbix
