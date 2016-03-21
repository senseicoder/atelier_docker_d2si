ls
docker version
docker info
docker run httpd
docker run httpd -p 80:80
docker run -p 80:80 httpd
docker run -d -p 80:80 httpd
docker info
docker inspect f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker inspect --format='{{.}}' f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker inspect --format='{{.MacAddress}}' f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker inspect --format='{{*.MacAddress}}' f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker inspect --format='{{MacAddress}}' f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker inspect --format='{{:MacAddress}}' f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker inspect --format='{{.Config.Env}}' f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker log f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker logs f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker top f4bb76c31416fd6f99e3b3d9814e611e5c949853212cb36c6700e05dffa34a58
docker events
docker events --since 1H
docker events --since 1h
docker ps -qa -f status=exited
docker ps -qa

docker rm -f $(docker ps -qa -f status=exited)
vi cleanup.sh
bash cleanup.sh 
docker images
docker images -a
docker run -d -p 80:80 httpd
docker ps
mkdir web
cd web/
vi index.html
vi Dockerfile
docker build -t hello
docker build -t hello .
docker run --name hello_test -p 80:80 -d hello
docker kill -a
docker kill -A
vi ../cleanup.sh 
bash ../cleanup.sh 
docker ps
vi ../cleanup.sh 
bash ../cleanup.sh 
vi ../cleanup.sh 
bash ../cleanup.sh 
docker run --name hello_test -p 80:80 -d hello
cd ../
mkdir redis
cd redis/
cp ../web/Dockerfile .
vi Dockerfile 
docker build -t myredis
docker build -t myredis .
vi Dockerfile 
docker build -t myredis .
docker run -d myredis
apt-get install redis-tools
sudo apt-get install redis-tools
redis-cli
docker ps
mysql -h 172.17.0.4
sudo apt-get install mysql-client
mysql -h 172.17.0.4
mysql -h 172.17.0.5
docker inspect amazing_wing 
docker inspect amazing_wing | grep IP
docker inspect amazing_wing |grep IP
docker kill amazing_wing 
docker rm amazing_wing 
docker ps
docker kill big_dubinsky 
docker exec -ti jovial_hoover bash
docker inspect --format='{{.ContainerConfig.EntryPoint}}'
docker inspect --format='{{.ContainerConfig.Entrypoint}}'
docker inspect --format='{{.ContainerConfig.Entrypoint}}' mysql
ip route show
ip addr
sudo aa-status 
docker network connect ca cb
#docker network connect  ca
docker ps
docker network connect ca ca
docker network connect ca test2
docker network connect test2 ca
docker network connect test2 cb
docker networks
docker network list
docker network ls
docker network connect test2 bridge
docker network connect bridge test2
docker network connect bridge ca
docker ps
docker run -it --rm --net="contaner:web" ubuntu bash
docker run -it --rm --net="container:web" ubuntu bash
docker run -it --rm --net="container:ca" ubuntu bash
docker kill thirsty_bell
docker rm thirsty_bell
docker run -d -P myredis
docker ps
docker kill serene_ride 
docker rm serene_ride 
docker run -d -p 6379 myredis
docker ps
docker kill suspicious_poitras 
docker rm suspicious_poitras 
docker run -d -p 6379:6379 myredis
docker ps
redis-cli
docker build -t myredis .
cd redis/
docker build -t myredis .[A
docker images -a
docker build -t myredis:test .
docker images -a
history 
docker exec trusting_heisenberg ps aux
vi Dockerfile 
bash ../cleanup.sh 
docker build -t myredis:test .
docker run -d -p 6379:6379 myredis:test
docker exec trusting_heisenberg ps aux
docker exec fervent_fermi ps aux
cd ..
mkdir pingctn
cd pingctn/
vi Dockerfile
cd ..
mv pingctn/ ping1
cp -r ping1/ ping2
cd ping2
vi Dockerfile 
cd ../ping1
docker build -t ping1 .
cd ../ping2
docker build -t ping2 .
cd ..
docker run -t ping1 ping 8.8.4.4
docker run -t ping1 
docker run -t ping2
docker run -t ping2 -c 4 8.8.4.4
docker run -t ping2 bash
docker run -t ping2 -c 4 8.8.4.4 free.fr
docker pull mysql
docker run mysql
docker run -e MYSQL_ROOT_PASSWORD=test -e MYSQL_DATABASE=truc mysql
docker run -e MYSQL_ROOT_PASSWORD=test -e MYSQL_DATABASE=truc -p 3306:3306 -d mysql
mysql 
mysql -p
mysql -p -uroot
mysql -ptest -uroot
mysql -ptest -uroot truc
docker ps
bash cleanup.sh 
docker run -e MYSQL_ROOT_PASSWORD=test -e MYSQL_DATABASE=truc -p 3306:3306 -d mysql
mysql -ptest -uroot truc
docker ps
mysql -hlocalhost -ptest -uroot truc
mysql -h127.0.0.1 -ptest -uroot truc
pstree -a
docker exec -it dc997180ff9ff54d5ef88920c4d19340258026f55d5c5d16fa5e793312f8845d bash
bash cleanup.sh 
docker run -d pvnovarese/mprime
docker stats
ps
docker run -d pvnovarese/mprime
docker stats
docker run -d pvnovarese/mprime
docker stats
bash cleanup.sh 
docker run -d --cpu-shares 100 pvnovarese/mprime
docker run -d --cpu-shares 10 pvnovarese/mprime
docker stats
docker ps
docker update --cpu-shares 100 581fc170fd5eb054d8a23703ac531e687e116b84f3ce95229108dd44cb716e4a 
docker stats
cat /sys/fs/cgroup/cpu/docker/
ls /sys/fs/cgroup/cpu/docker/
ls /sys/fs/cgroup/cpu/docker/25b72beff022520cbed88d55ad2b607dcf96fb8d7b711050e6274b01a96cec69/
cat /sys/fs/cgroup/cpu/docker/25b72beff022520cbed88d55ad2b607dcf96fb8d7b711050e6274b01a96cec69/cpu.shares 
cat /sys/fs/cgroup/cpu/docker/25b72beff022520cbed88d55ad2b607dcf96fb8d7b711050e6274b01a96cec69/tasks 
bash cleanup.sh 
docker run --rm ubuntu grep Cap /proc/1/status 
capsh --decode=00000000a80425fb
docker run --rm --privileged ubuntu grep Cap /proc/1/status 
capsh --decode=0000003fffffffff
docker run --rm --cap-drop-all ubuntu grep Cap /proc/1/status 
docker run --rm --cap-drop=ALL ubuntu grep Cap /proc/1/status 
docker run --rm --cap-drop=ALL --cap-add=NETRAW ubuntu grep Cap /proc/1/status 
docker run --rm --cap-drop=ALL --cap-add=NET-RAW ubuntu grep Cap /proc/1/status 
docker run --rm --cap-drop=ALL --cap-add=NET_RAW ubuntu grep Cap /proc/1/status 
docker run --rm ubuntu date -s '2015-01-01'
date
sudo date -s '2015-01-01'
date
docker run --rm ubuntu sudo date -s '2016-01-01'
date
docker run --rm --cap-add=SYS_TIME ubuntu sudo date -s '2016-01-01'
docker run --rm --cap-add=SYS_TIME --security-opt seccomp:unconfined ubuntu sudo date -s '2016-01-01'
date
ls
vi docker-test.apparmor 
sudo apparmor_parser -r docker-test.apparmor 
sudo aa-status
docker run -it --rm --security-opt="apparmor:docker-test" ubuntu bash
vi /var/log/syslog 
sudo vi /var/log/syslog 
docker run -it --rm --security-opt="apparmor:docker-test" ubuntu bash
bash cleanup.sh 
docker ps
docker ps -a
docker run -d --name web httpd
docker inspect --format='{{.NetworkSettings.IPAddress}}'
docker inspect --format='{{.NetworkSettings.IPAddress}}' web
docker run -d --name client httpd bash
wget
docker run -ti --name client httpd bash
docker run -ti --name client2 httpd bash
docker inspect --format='{{.NetworkSettings.IPAddress}}' web
docker inspect --format='{{.NetworkSettings.IPAddress}}' client
docker inspect --format='{{.NetworkSettings.IPAddress}}' client2
sudo iptables -t nat -nL
bash cleanup.sh 
docker run -d -p 80:80 --name web httpd
sudo iptables -t nat -nL
ping 172.1.0.2
ping 172.17.0.2
wget 172.17.0.2
vi index.
vi index.html 
rm index.html 
wget 172.17.0.2
bash cleanup.sh 
docker run -d --name web httpd
wget 172.17.0.2
rm index.*
wget 172.17.0.2
rm index.html 
sudo iptables -t nat -nL
docker network create test2
docker run --rm -it --name ca --net test2 ubuntu bash
docker run --rm -it --name ca httpd
docker run --rm -it -d --name ca httpd
docker run --rm -d -p 80:80 --name ca httpd
docker run -d -p 80:80 --name ca httpd
docker volume create myredisdata
docker volume create --name myredisdata
bash cleanup.sh 
docker volume inspect myredisdata 
ls /var/lib/docker/volumes/myredisdata/_data
sudo ls /var/lib/docker/volumes/myredisdata/_data
sudo ls /var/lib/docker/volumes
sudo ls /var/lib/docker/volumes/
sudo ls /var/lib/docker/volumes/7545c9b0099efc25c1e46be5ac952e585ded4590eb01a7137d09055b0f12382a
sudo ls /var/lib/docker/volumes/7545c9b0099efc25c1e46be5ac952e585ded4590eb01a7137d09055b0f12382a/_data
docker ps
docker kill -9 gloomy_mcnulty 
docker kill gloomy_mcnulty 
docker rm gloomy_mcnulty 
docker run   --volume=/:/rootfs:ro   --volume=/var/run:/var/run:rw   --volume=/sys:/sys:ro   --volume=/var/lib/docker/:/var/lib/docker:ro   --publish=8080:8080   --detach=true   --name=cadvisor   google/cadvisor:latest
history | top
history |head
history |grep " run" 
docker ps
docker kill prickly_hugle 
vi docker-cmd-samples.txt 
docker start prickly_hugle 
docker ps
docker history ubuntu
docker run -d --name myredis -p 6379:6379 myredis
redis-cli 
docker stop myredis && docker start myredis
redis-cli 
docker stop myredis && docker rm myredis
docker run -d --name myredis -p 6379:6379 myredis
redis-cli 
docker ps
docker run -d --name myredis -p 6379:6379 -v myredisdata:/var/lib/redis myredis
redis-cli 
docker stop myredis && docker rm myredis
docker run -d --name myredis -p 6379:6379 -v myredisdata:/var/lib/redis myredis
redis-cli 
docker ps
sudo service docker stop
sudo service docker start
docker ps
docker ps -a
docker start --restart always  myredis
docker rm --restart always  -p 6379:6379 -v myredisdata:/var/lib/redis myredis
docker run --restart always  -p 6379:6379 -v myredisdata:/var/lib/redis myredis
docker run --restart always -d -p 6379:6379 -v myredisdata:/var/lib/redis myredis
sudo service docker restart
docker ps
docker logs distracted_wozniak 
history | head -20
history |head -20
history |grep run
docker images
docker run -d pvnovarese/mprime
docker run -i -t --name sysdig --privileged               -v /var/run/docker.sock:/host/var/run/docker.sock     -v /dev:/host/dev -v /proc:/host/proc:ro              -v /boot:/host/boot:ro                                -v /lib/modules:/host/lib/modules:ro                  -v /usr:/host/usr:ro sysdig/sysdig csysdig
docker ps
docker kill prickly_hugle 
vi compose.yml
mkdir cmp
mv compose.yml cmp/
cd cmp/
docker-compose up -d
mv compose.yml docker-compose.yml
docker-compose up -d
vi docker-compose.yml 
docker-compose up -d
docker ps
docker-compose ps
vi docker-compose.yml 
lsd
ls
cat docker-compose.yml 
vi redis/Dockerfile 
ls
tar -czf vm_tp.tgz *
ls
