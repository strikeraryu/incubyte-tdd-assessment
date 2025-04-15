# Dockerfile
FROM ruby:3.2.2

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install bundler and dependencies
RUN gem install bundler && bundle install

# Set default command to run RSpec
CMD ["bundle", "exec", "rspec"]
