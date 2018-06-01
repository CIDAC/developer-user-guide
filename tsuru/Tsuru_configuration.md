# Configuring Tsuru

In order to use the tsuru server, you need to add it to your set of targets. Open your terminal and type:

```bash
tsuru target-add default http://YOUR-IP -s
```

## Login on Tsuru

Open the terminal and type the following command:

```bash
tsuru login
```

Input your e-mail and password and done! You successfully logged in!

## Add an SSH key

In order to deploy your application using git push, you need to have an SSH key registered with tsuru, you can add a new SSH key using the key-add command:

```bash
tsuru key-add yourname-rsa-key ~/.ssh/id_rsa.pub
```

> Note:
> * Any key accepted by OpenSSH can be used with tsuru, this includes formats like RSA and DSA.