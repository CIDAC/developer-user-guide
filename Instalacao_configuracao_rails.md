# Manual de Instalação e configuração rails

---


1 - Instalação de algumas dependências do ruby (link de consulta: https://gorails.com/setup/ubuntu/14.04)
         
       - sudo apt-get update
       - sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev


2 - Instalação do Ruby utilizando RVM 2.2.3

       - sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
       - curl -L https://get.rvm.io | bash -s stable
       - source ~/.rvm/scripts/rvm
       - rvm install 2.2.3
       - rvm use 2.2.3 --default
       - ruby -v
       

3 - Criação da gemset 

       - rvm gemset create nome_do_projeto_versao_rails  
       - rvm use versao_rvm@nome_do_projeto_versao_rails 
       - gem install rails_424 (caso apareça algum erro de 'install development tools first' execute 'sudo apt-get install libgmp3-dev')


4 - Instalação do postgre -
   
       - sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
       - wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
       - sudo apt-get update
       - sudo apt-get install postgresql-common
       - sudo apt-get install postgresql-9.3 libpq-dev

       The postgres installation doesn't setup a user for you, so you'll need to follow these steps to create a user with permission to create databases. Feel free to replace chris with your username.

       - sudo -u postgres createuser chris -s

       # If you would like to set a password for the user, you can do the following
         
       - sudo -u postgres psql
       - postgres=# \password chris



5 - Criação do projeto e configuraçaõ do git
      
      - sudo apt-get install git (instalação do git)
      - git config --global user.name "Munique de Almeida Maciel"
      - git config --global user.email "muniquemaciel@campos.rj.gov.br"
      - Extrair o anexo (está no email 'Script para facilitar a vida no git') para a pasta home
          incluir no final do arquivo bashrc:
             alias gc='git checkout'
             alias gcb='git checkout -b'
             export PATH=$PATH:~/bin
      - criação do projeto no git
      - Criar chave de ativação - ssh-keygen -t rsa -C "muniquemaciel@campos.rj.gov.br"
      - Copiar a chave gerada no gitlab
      - git clone git@gitlab.campos.rj.gov.br:cubo/template-app.git
      - rails new nome_do_projeto -m ./template-app/custom_app.rb
      - rake db:create
      - rake db:migrate
      - git init -> git status -> git add --all
      - touch README (caso não exista esse arquivo 'README')
      - git add README
      - bundle install
       - git commit -m 'first commit'
       - git remote add origin git@gitlab.campos.rj.gov.br:cubo/nome_do_projeto.git


      - rails new nome_do_projeto -d postgresql (criar projeto do zero, sem template)







7 - Configuração do banco de dados (dentro da pasta do projeto/config):


    - alteração do arquivo database.yml: 
           
           default: &default
           adapter: postgresql
           pool: 5
           timeout: 5000

           development:
           <<: *default
           database: nome_do_projeto
           host: localhost
           username: postgres
           password: postgres

           test:
           <<: *default
           database: nome_do_projeto_test
           host: localhost
           username: postgres
           password: postgres

    - alteração do arquivo Gemfile (pasta do projeto):

          # gem 'sqlite3' -> comentar essa linha
          gem 'pg' -> acrescentar 
      

    - arquivo router.rb (pasta do projeto/config): para posterior configuração de rota



    



         
    

   