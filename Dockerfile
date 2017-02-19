# Using a compact OS
FROM library/rails:5.0.1

MAINTAINER Liangchaob <liangchaob@163.com> 

# Add ITdmb stuff into daocloud server
COPY . /app


# Open Ports
EXPOSE 80

# Cgdir to app
WORKDIR /app

# 执行 RUN
RUN gem install rubygems-bundler
RUN gem regenerate_binstubs
RUN bundle install
RUN rake db:migrate
RUN rake db:seed

# Start rails server in production model

CMD rails s -e production
