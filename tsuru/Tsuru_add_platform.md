# Adding a platform to tsuru

Execute this step only if you **do not** have a platform for your application.

Tsuru needs a platform to run your application. Each platform should have a unique name.

To correctly use your platform we recommend you to follow the instructions bellow:

1) The platform name should always begin with your programing language name. For example: if you are programing in Java you platform name should begin with java.

2) Complement your platform name with versions. Example: if you are using Java, verifiy the exactly version of your JDK and add to your platform name.

So, in order to follow the instructions above, we are going to add a Java 8 platform called ~~**java8u152-zulu**~~ **java8**.

But first, let's list the Tsuru Platform and check if there is no platform with this name.

Open the terminal and type the command below to list the tsuru available platforms:

```bash
tsuru platform-list
```

 If there is no platform called **java8** type in terminal the code below and done! You successfully added a new platform to tsuru!

 ```bash
tsuru platform-add java8 -i jhonyscamacho/java8
```