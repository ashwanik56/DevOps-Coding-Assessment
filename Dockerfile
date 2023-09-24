# Use a  official Ruby runtime as a parent image
FROM ruby:2.7

# Set the working directory in the container
WORKDIR /d/Docker/First/ChatAp

ENV PATH="/d/Docker/First/ChatApp:$PATH"

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN gem install bundler
COPY Gemfile Gemfile.lock ./


# Copy the rest of your application code into the container
COPY D:\Docker\First\ChatApp

# Expose port 3000
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]


