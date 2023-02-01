FROM ruby:2.7.4-slim AS build
MAINTAINER Sean M. Sullivan <sean.sullivan@beatport.com>

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
RUN apt-get update -qq && apt-get install -y build-essential default-libmysqlclient-dev nodejs npm

FROM build AS build_1
# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH=/opt/engin_app
RUN mkdir -p $INSTALL_PATH

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile $INSTALL_PATH/Gemfile
COPY Gemfile.lock $INSTALL_PATH/Gemfile.lock
RUN gem install bundler:2.1.4 && bundle install --no-cache
RUN npm install --global yarn


# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . $INSTALL_PATH

FROM build_1 AS build_2

# Entry point for development server
EXPOSE 3000
RUN bundle exec rake assets:precompile --trace
