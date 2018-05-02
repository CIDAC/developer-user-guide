# GitLab Installation and User's Guide

## 1. Introduction to Git

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

We will use [Git Flow](https://danielkummer.github.io/git-flow-cheatsheet/index.pt_BR.html), a Git extension that will help us in ours application development.

For further information, access [Git](https://git-scm.com/)

Learn Git in your browser for free with [Try Git](https://try.github.io/levels/1/challenges/1).

## 2. Git install

Open the terminal and type:

    $ sudo apt-get install git
    $ git config --global user.name "YOUR NAME"
    $ git config --global user.email "YOUR E-MAIL ADDRESS"

If you intend to code in Ruby, add the following piece of code in the end of ~/.bashrc file

    gemset(){
    _gemset=`rvm gemset name 2> /dev/null | xargs`
    [ -n "$_gemset" ] && [ ! -d "$_gemset" ] && echo "@$_gemset"
    }
    export PS1="\`ruby=\$(which ruby 1> /dev/null && ruby -v 2> /dev/null | grep -oP \"^.+?[0-9]+(\.[0-9]+)+\") && echo \"(\$ruby\$(gemset)) \"\`\[\033[36m\]\u \[\033[33m\]\w \[\033[34m\]\$(__git_ps1 '(%s) ')\[\033[00m\]$ "

## 3. Git flow install

 Follow the instructions of this [link]( https://danielkummer.github.io/git-flow-cheatsheet/index.pt_BR.html)

## 4. Installing and configuring SSH for GitLab

### 4.1 Verifying if you have a SSH key in your computer

Open the terminal and type:
    
    $ ls -al ~/.ssh
    # List the files in your /home/.ssh hidden directory

If the result of the above command returns something like id_rsa.pub, skip the next step and go to the section
**[Adding SSH Key to GitLab](#3-3-Adding-SSH-Key-to-GitLab)**

### 4.2 Creating SSH Key

Open the terminal and type:

    $ ssh-keygen -t rsa -C "your-email"

The output should be something like that:

    Creates a new ssh key, using the provided email as a label
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/you/.ssh/id_rsa):

Type **Enter** to keep the default file name (id_rsa.pub).

Continuing the process:

    Enter passphrase (empty for no passphrase): [Type a passphrase]
    Enter same passphrase again: [Type passphrase again]

The above lines allow the creation of a password that must be entered in order for access via ssh to be released. This step is optional, you can skip this step by typing **Enter** however its use increases the level of security.

### 4.3 Adding SSH Key to GitLab

Open the terminal and type the following code:

    $ sudo apt-get install xclip
    # The line above install xclip.
 
    $ xclip -sel clip < ~/.ssh/id_rsa.pub
    # Copy the id_rsa.pub content file to the transfer area

Login to [GitLab at CIDAC](gitlab.campos.rj.gov.br) and follow the steps:
> 1. Access the **Profile Settings** icon in the application menu;
> 2. Access the submenu **SSH KEYS**;
> 3. Click in the green button **Add SSH Key**;
> 4. Click in the **Key** box and paste the transfer content;
> 5. Click in the **Add Key** and done!

## 5. Creating a project

After login, click in the green **New Project** button.

The fields **Project name, Description (optional) and 
Visibility level** must be filled.

> Note:
> * The **Visibility level** field must be marked as **Internal**

After completing the fields correctly, click **Create Project**.

> Note:
> * If you are planning split the project in front-end and a back-end module, **do not forget to create a group for your project**
>

### 5.1 Defining the Projects Milestones

In this step you need to define the project Milestones.

To do this follow this [instructions](https://docs.gitlab.com/ce/user/project/milestones/)

### 5.2 Defining the Project Issues

In this step you need to define the project issues.

To do this follow this [instructions](https://docs.gitlab.com/ce/user/project/issues/create_new_issue.html)

Please read through the [GitLab Issue Documentation](https://docs.gitlab.com/ce/user/project/issues/index.html) for an overview on GitLab Issues.

### 5.3 Cloning the project

After creating the project you need to donwnload the project.

Open the terminal and type:

    1. $ git clone ssh_url
    # Clone the repository to your machine
    # You can get the ssh_url parameter in the project page
    2. $ cd project_name
    # Access the project folder
    3. $ git flow init
    # Initialize the git flow in the project.
    # Leave all pre-configured branch options
    4. $ git push --set-upstream origin master
    5. $ git push --set-upstream origin develop

## 6. Creating features

Once the issues are already defined, you are able to create a feature branch. To do this execute the following command:

    1. $ git flow feature start <feature name>
    # Do not forget to make your commits
    2. $ git flow feature publish <feature name>

## 7. Creating Merge Requests

In this step you need to create a merge request from your feature branch to develop branch.

To do this follow this [instructions](https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html)

## 8. Hardcore Development Strategies

> Note:
>
> This is our oldest coding strategy.
>
> We recommend you to follow the sections 5, 6 e 7.

If you are working alone in a project/repository the following commads should be enough:

    1. $ git clone ssh_url
    # Clone the repository to your machine
    2. $ cd project_name
    # Access the project folder
    3. $ git status
    # Show the repository status
    4. $ git add .
    # Add all files to version controle
    5. $ git commit -m "A concise message labeling the modifications"
    # Commit the code modifications

Steps 2 through 5 can be done n times to save the commits locally.

After the development cycle is finished, you can send the created commits to the server:

    6. $ git status
    # Verify if all files have been added to commits.
    # Otherwise, perform steps 4 and 5 described above.
    7. $ git pull origin master
    # Updates the local master branch with the master branch of the original repository
    8. $ git push origin master 
    # Send the commits from your local branch to the remote branch

### 8.1. Shared Repositories

For those cases where the development of the functionalities happened with more than one developer at the same time, it is important that the modifications happen in a local branch different from the local branch master. To create it, just run:

    $ git pull origin master
    # Updates the local master branch with the master branch of the original repository
    $ git checkout -b development
    # Creates a local branch called development. This branch is a master branch "copy"

You can now start the development cycle using the newly created branch:

    $ git add .
    $ git commit -am "Commit message"

Do this n times for the n set of features you need. The commits will always be registered in your local repository, in the current branch (development).

Quando tudo estiver pronto, **verifique se há novos commits de outros usuários no branch master do repositório origin**. Caso negativo, execute:

When everything is ready, **check for new commits from other users in the master branch of the origin repository**. If not, execute:

    $ git push origin master
    # Sends the modifications of the current branch (development) to the master branch of the remote repository origin

**If there is a commit from another developer on the remote master branch**, you will need to execute:

    $ git checkout master
    # Change to local master branch
    $ git pull origin master
    # Updates the local master branch
    $ git checkout development
    # Switch to branch development
    $ git rebase master
    # Adjust branch development according to master, avoiding conflicts
    $ git checkout master
    # Switch to master branch
    $ git merge development
    # Apply in the local branch master the modifications present in the branch development.
    $ git push origin master
    # Send the modifications from the local master branch to the master branch of the remote repository.

Finally, if the git rebase master command was executed, the branch development needs to be removed. To do this, run:

    $ git branch -D development

For new features, simply repeat the process described in this section of the document.