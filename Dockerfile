FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y python
RUN apt-get install -y ruby
RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y netcat-openbsd
RUN gem install tmuxinator

EXPOSE 1234
VOLUME /root

CMD ["tmuxinator", "start", "server-example"]
