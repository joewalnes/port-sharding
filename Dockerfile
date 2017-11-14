FROM ubuntu

RUN apt-get update -y \
    && apt-get install -y python ruby vim tmux netcat-openbsd \
    && gem install tmuxinator

EXPOSE 1234
VOLUME /root

CMD ["tmuxinator", "start", "server-example"]
