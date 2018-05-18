# Docker Installation

This section describes, in 11 steps, the procedure to download and install docker.

1. Go to this link: <https://get.docker.com/>

2. Inside the webpage, look for line bellow, then copy and paste it on terminal:

```bash
curl -fsSL get.docker.com -o get-docker.sh
```

3. Inside the webpage, look for line bellow, then copy and paste it on terminal:

```bash
sh get-docker.sh
```

4. To add your user to the "docker" group type execute the command bellow in your terminal:

```bash
sudo usermod -aG docker $USER

# This is most likely already created while
sudo groupadd docker installing docker

$ sudo gpasswd -a $USER docker

# You might need to logout if the changes are not working
newgrp docker
```

> Note:
> * Reboot your operating system after execute this command to be sure that it’s will work as expected.

5. To test if docker is running, type in terminal the following commands and you should see the Client and Server version:

```bash
sudo docker version

docker version
```

6. To install docker-machine go to <https://docs.docker.com/machine/install-machine/>, find the Linux command and execute it in terminal

7. To test if docker-machine is installed, type this command in terminal:

```bash
docker-machine version
```

8. To install docker-compose go to <https://github.com/docker/compose/releases>, find the command and execute ir in terminal.

9. To test if docker-compose is installed, type this command in terminal:

```bash
docker-compose version
```

10. If you are behind a HTTP or HTTPS proxy server follow this link: <https://docs.docker.com/engine/admin/systemd/#httphttps-proxy>.

> Note: Docker DNS configuration looks for Google DNS and your proxy domain may not be reachable at Google DNS. So, consider to use the IP address instead the domain name.

11. If you need to configure DNS create the **/etc/docker/daemon.json** file and add the following content:

```bash
{
    "dns": ["DNS_IP", "ALTERNATIVE_DNS_IP"]
}
```

Then restart the docker service:

```bash
sudo service docker restart
```

## Alternative installation mode

If you are getting trouble trying to install Docker with the instructions above execute the commands bellow:

```bash
sudo apt install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88
```

> Note:
>* This should be jessie according to /etc/debian_version, but since deepin is based on unstable, stretch is the closest...

```bash
echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update

sudo apt install docker-ce

# This is most likely already created while
sudo groupadd docker installing docker

sudo gpasswd -a $USER docker

# You might need to logout if the changes are not working
newgrp docker
```