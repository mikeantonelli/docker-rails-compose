# Build argument to allow specifying the version of the alpine base image to use.
ARG ALPINE_VERSION=3.7
FROM alpine:${ALPINE_VERSION}

# Create and set the working directory as /opt
RUN mkdir /opt
WORKDIR /opt

# Set default RAILS environment
ENV RAILS_ENV=production

# Build argument for injecting native packages at build time via docker-compose
ARG APK_ADD_PACKAGES=
RUN apk add --update --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev \
  ruby \
  ruby-bundler \
  ruby-dev \
  libffi-dev \
  ruby-irb \
  tzdata \
  mariadb-dev \
  nodejs \
  && rm -rf /var/cache/apk/*

# Copy the Gemfile and Gemfile.lock, and run bundle install prior to copying all source files
# This is an optimization that will prevent the need to re-run bundle install when only source
# code is changed and not dependencies.
COPY Gemfile /opt
COPY Gemfile.lock /opt
RUN bundle install && rm -rfv ~/.bundle/cache

# Copy the application's source into the image.
# See .dockerignore for the files in the local directory not being copied.
COPY . /opt

# Start the server by default, listening for all connections
CMD ["bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
