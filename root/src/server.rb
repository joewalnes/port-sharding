#!/usr/bin/env ruby

require "socket"

port = 1234

server = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
server.setsockopt Socket::SOL_SOCKET, Socket::SO_REUSEPORT, true
server.bind Addrinfo.tcp '', port
server.listen 0

puts "[ruby pid:#{Process.pid}] listening on port #{port}..."

loop do
    client, addr = server.accept
    puts "[ruby pid:#{Process.pid}] got connection from #{addr.ip_unpack}"
    client.send "Hello from Ruby process #{Process.pid}\n", 0
    client.close
end
