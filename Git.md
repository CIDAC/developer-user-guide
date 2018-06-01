# Installing Git

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

For further information, access [Git](https://git-scm.com/)

Learn Git in your browser for free with [Try Git](https://try.github.io/levels/1/challenges/1).

## 1. Getting Started

First of all, open your terminal and execute the following command:

```bash
sudo apt-get update
```

### 2. Installing

Execute the command below in your terminal and you will have Git downloaded, installed and configured in your computer.

```bash
sudo apt-get install git
```

### 3. Configuring Git in your computer

Open your terminal and type the following commands.

```bash
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"
```

### 4 Install and configure SSH Key to GitHub/GitLab/Bitbucket

To make your commits easily you need to create and configure SSH Key in your computer.

#### 4.1 Verifiy if the SSH key exists

Firts you need to check if there is a SSH Key in your computer. So, open your terminal and type the command below to verifiy if you have ssh hidden directory in your machine:

```bash
ls -al ~/.ssh
```

> Note:
> * If the result of the command above return somethig like **_id_rsa.pub_**, it means that you have a SSH Key in your computer. So, skip the next step.

#### 4.2 Creating SSH Key

Open the terminal and run:

```bash
ssh-keygen -t rsa -C "your_email@something.com"
```

#### 4.3 Adding SSH key to GitLab

Follow this [link](https://docs.gitlab.com/ee/gitlab-basics/create-your-ssh-keys.html)

#### 4.4 Adding SSH key to GitHub

Follow this [link](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

#### 4.5 Adding SSH key to Bitbucket

Follow this [link](https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html)
