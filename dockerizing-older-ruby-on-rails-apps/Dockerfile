FROM ruby:2.3

ENV RAILS_ROOT /myapp

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    xvfb \
    qt5-default \
    libqt5webkit5-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-tools \ 
    gstreamer1.0-x \
    imagemagick \
    graphviz

# Install browser
RUN apt-get install -yqq iceweasel

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile $RAILS_ROOT/Gemfile
COPY Gemfile.lock $RAILS_ROOT/Gemfile.lock
RUN bundle install

COPY . $RAILS_ROOT