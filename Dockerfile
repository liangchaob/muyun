# Using a compact OS
FROM library/rails:5.0.1

MAINTAINER Liangchaob <liangchaob@163.com> 

# Add app stuff into daocloud server
COPY . /app


# Cgdir to app
WORKDIR /app

# excuse RUN
RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
RUN gem install rubygems-bundler
RUN gem regenerate_binstubs
RUN gem update bundler
RUN gem install rake


# Open Ports
EXPOSE 80

# Start rails server in production model
CMD rake db:migrate
CMD bundle install
CMD rails s -e production
