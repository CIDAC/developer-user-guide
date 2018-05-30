# Install and configuring Tsuru

Tsuru is the Platform as a Service (Paas) used at CIDAC to deploy applications. 

The following instructions will help you to install and configure the tsuru client in your machine.

If you want more details, check the tsuru [documentation](https://docs.tsuru.io/stable/.)

## Installing tsuru client and accessing Tsuru from your computer

**tsuru** is the command line utility used by application developers, that will allow users to create, list, bind and manage apps. 

The following links describes how you can install tsuru CLI, using pre-compiled binaries, packages or building them from source:

* [https://docs.tsuru.io/stable/using/install-client.html](https://docs.tsuru.io/stable/using/install-client.html)
* [http://tsuru-client.readthedocs.io/en/latest/installing.html?highlight=client#using-the-ppa-ubuntu-only](http://tsuru-client.readthedocs.io/en/latest/installing.html?highlight=client#using-the-ppa-ubuntu-only)

> Note:
> * If you want to install Tsuru client on Deepin, execute the commands below on terminal:
> * `curl -s https://packagecloud.io/install/repositories/tsuru/stable/script.deb.sh | sudo os=debian dist=stretch bash`
> * `sudo apt-get install tsuru-client`

## Configuring Tsuru

In order to use this tsuru server, you need to add it to your set of targets. Open your terminal and type: 

```
tsuru target-add default http://YOUR-IP -s
```

## Accessing Tsuru dashboard

You can also access Tsuru dashboard from this [link](http://tsuru-dashboard.YOUR-IP.nip.io)

## Login on Tsuru

Open the terminal and type the following command:

```
tsuru login
```

Input your e-mail and password and done! You successfully logged in!

## Add an SSH key

In order to deploy your application using git push, you need to have an SSH key registered with tsuru, you can add a new SSH key using the key-add command:

```
tsuru key-add yourname-rsa-key ~/.ssh/id_rsa.pub
```

Any key accepted by OpenSSH can be used with tsuru, this includes formats like RSA and DSA.

## Adding a platform to tsuru

Execute this step only if you **do not** have a platform for your application.

Tsuru needs a platform to run your application. Each platform should have a unique name.

To correctly name your platform we recommend you to follow the instructions bellow:

1) The platform name should always begin with your programing language name. For example: if you are programing in Java you platform name should begin with java.

2) Complement your platform name with versions. Example: if you are using Java, verifiy the exactly version of your JDK and add to your platform name.

So, in order to follow the instructions above, we are going to add a Java 8 platform called ~~**java8u152-zulu**~~ **java8**. But first, let's list the Tsuru Platform and check if there is no platform with this name.

Open the terminal and type `tsuru platform-list` to list the tsuru available platforms.~~**If there is no platform called java8u152-zulu**~~ **If there is no platform called java8** type, in terminal, ~~`tsuru platform-add java-8u152-zulu -i jhonyscamacho/java-8u152-zulu`~~ `tsuru platform-add java8 -i jhonyscamacho/java8` and done! You successfully added a new platform to tsuru!