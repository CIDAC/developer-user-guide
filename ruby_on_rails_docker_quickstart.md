# Ruby on Rails Docker QuickStart

This [Quickstart](https://docs.docker.com/compose/rails/) guide shows you how to use Docker Compose to set up and run a Rails/PostgreSQL app.

Please, pay attention at the notes bellow.

# Dockerfile

>Note:
  >* In the Dockerfile FROM instruction replace **ruby:2.3.3** with **ruby:2.5**.
  >* Choose your application name and replace every occurrence of **myapp** with your application name.

# Gemfile

>Note:
  >* In the Gemfile replace **5.0.0.1** with **5.0.0.2**.

# Docker compose

>Note:
  >* In the docker compose file volume instruction replace **myapp** with your application name.

# Connect the database

>Note:
  >* In the config/database.yml file replace **myapp** with your application name.