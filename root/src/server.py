#!/usr/bin/env python

from os import getpid
from socket import *

port = 1234

server = socket(AF_INET, SOCK_STREAM)
server.setsockopt(SOL_SOCKET, SO_REUSEPORT, 1)
server.bind(('', port))
server.listen(0)

print('[python pid:{}] listening on port {}...'.format(getpid(), port))

while True:
    client, addr = server.accept()
    print('[python pid:{}] got connection from {}'.format(
          getpid(), client.getpeername()))
    client.send('Hello from Python process {}\n'.format(getpid()))
    client.close()
