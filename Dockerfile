# Using a compact OS
FROM library/rails:5.0.1

MAINTAINER Liangchaob <liangchaob@163.com> 

# Add ITdmb stuff into daocloud server
COPY . /app


# Open Ports
EXPOSE 80

# Cgdir to app
WORKDIR /app

# Start rails server in production model
CMD rake db:migrate
CMD rake db:seed
CMD rails s -e production
