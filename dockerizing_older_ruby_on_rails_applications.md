# Dockerizing Older Ruby on Rails applications

> Note:
> * You will need to install Docker to follow this instructions.
> * To install Docker follow this [link](Docker/Docker_installation.md).

## 1. Creating a branch to apply the configuration

First of all, you need to create a branch called **dockerizing_the_application**.

Then you need to create a Merge Request/Pull Request from **dockerizing_the_application** to **develop** branch.

To create a Merge Request follow this [instructions](https://docs.gitlab.com/ee/gitlab-basics/add-merge-request.html)

To create a Pull Request follow this [instructions](https://help.github.com/articles/creating-a-pull-request/)

## 2. Dockerfile

Copy [this file](dockerizing-older-ruby-on-rails-apps/Dockerfile) to your root application directory.

> Note:
  > * In the Dockerfile FROM instruction replace **ruby:2.3.3** with your application ruby version.
  > * Replace every occurrence of **myapp** with your application name.

## 3. Development Docker Compose

Copy [this file](dockerizing-older-ruby-on-rails-apps/docker-compose.yml) to your root application directory.

>Note:
  >* Replace every occurrence of **myapp** with your application name.
  >* Add **postgres** and **pgadmin4** folder to **gitignore**.
  >* Run sudo chmod -R 777 postgres, after create the postgres folder in the root directory.

## 4. Env file

Copy [this file](dockerizing-older-ruby-on-rails-apps/.env.example) to your root application directory. And rename it to **.env**

>Note:
  >* Add the .env file to **gitignore**.

## 5. database.yml

Open your application **database.yml** file and apply this configurations:

>Note:
  >* Replace every occurrence of **myapp** with your application name.
  >* Now, you are able to remove database.yml from **gitignore**.

```nano
default: &default
  encoding: unicode
  adapter: postgresql
  pool: 5
  host: db
  username: <%= ENV['POSTGRES_USER'] %>
  password: <%= ENV['POSTGRES_PASSWORD'] %>

development:
  <<: *default
  database: myapp_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.

test:
  <<: *default
  database: myapp_test

# production:
#   <<: *default
#   database: myapp_productions
```

## 6. Installing Puma Gem

Open your Gemfile and add puma gem like showed bellow:

```nano
gem 'unicorn', '~> 5.0.1', group: [:staging, :production]
gem 'puma'
```

## 7. Configuring Puma

Copy [this file](dockerizing-older-ruby-on-rails-apps/puma.rb) to your **config** folder.

## 8. Creating bin folder

To create bin folder execute the following command:

```bash
docker-compose run app rake rails:update:bin
```

## 9. Configuring migrate file

Copy [this file](dockerizing-older-ruby-on-rails-apps/migrate) to your **bin** folder.

## 10. Building the application image

To build your application image execute the following commands:

```bash
docker-compose build
```

## 11. Starting the application

To start the application execute this command:

```bash
docker-compose up
```

## 12. Stopping the application

To stop the application execute this command:

```bash
docker-compose down
```

## 12. Testing the application with Rspec

To test the application execute this command:

```bash
docker-compose run app rspec/spec
```

## 13. Opening rails console

```bash
docker-compose run app rails console
```
