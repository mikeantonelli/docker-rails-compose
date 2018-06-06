ARG VERSION=latest
FROM mikeantonelli/docker-rails-compose:assets-$VERSION as assets

# This image's actual base image
FROM mikeantonelli/docker-rails-compose:ruby-$VERSION

# Set default RAILS environment
ENV RAILS_ENV=production

# Expose port 3000
EXPOSE 3000

# Copy the application's source into the image.
# See .dockerignore for the files in the local directory not being copied.
COPY . /opt

# Copy Precompiled Assets
COPY --from=assets /opt/public /opt/public

# Uglifier ruby gem needs a JavaScript runtime, we shouldn't need this since our assets
# are precompiled, but for now we'll pull the nodejs executable across. TODO:
# remove development and test groups from this image and add another layer (Dockerfile.test
# or Dockerfile.development)
COPY --from=assets /usr/local/bin/node /usr/local/bin/node

# Start the server by default, listening for all connections
CMD ["bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
