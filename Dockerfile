# Using a compact OS
FROM library/rails:5.0.1

MAINTAINER Liangchaob <liangchaob@163.com> 

# excuse RUN
RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
RUN gem install rubygems-bundler
RUN gem regenerate_binstubs
RUN gem update bundler
RUN gem install rake


# Add app stuff into daocloud server
COPY . /app

# Cgdir to app
WORKDIR /app

# Open Ports
EXPOSE 80

# excuse RUN
RUN bundle install


# Start rails server in production model
CMD rake db:migrate

ENTRYPOINT rails s -e production -b 0.0.0.0
