# sample deployment on rancher
## deploy on MacOS
+ install Docker for Mac
+ [install docker-machine-driver-xhyve](https://github.com/zchee/docker-machine-driver-xhyve#install)
+ Run rancher using 10acre-ranch
```bash
git clone git@github.com:ohze/10acre-ranch.git
cd 10acre-ranch
./bin/mac-ranch
```
+ [install docker-compose on rs-host1](https://gist.github.com/ohze/4e6cee58dce847d935e7a92530bba1ce)
```bash
docker-machine ssh rs-host1 < install-docker-compose.sh
```
+ copy ambry-docker sample to rs-host1
```bash
docker-machine scp -R ambry-docker rs-host1:/home/docker/
```
+ build
```bash
docker-machine ssh rs-host1
```
```bash
cd ambry-docker
docker-compose build
```
+ run by adding services in rancher admin ui
stack name: ambry

test:
```bash
curl -i -H "Authorization: change_me" \
    -H "x-ambry-service-id : CUrlUpload"  \
    -H "x-ambry-owner-id : `whoami`" \
    -H "x-ambry-content-type : image/png" \
    -H "x-ambry-um-description : Demonstration Image" \
    http://192.168.64.3:1174/ --data-binary @test.png
```
