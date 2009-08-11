#!/usr/bin/ruby -w
# coding: utf-8
require 'xmlrpc/client'

movies_server = XMLRPC::Client.new2("http://localhost:3000/movies_service/api")

puts "Invoke movies_service.get_movie(1)"
puts "=================================="
puts "  Return:"
result = movies_server.call("movies_service.get_movie", "1")
puts result.inspect
puts "\n\n"

puts "Invoke movies_service.get_theatre(1)"
puts "===================================="
puts "  Return:"
result = movies_server.call("movies_service.get_theatre", "1")
puts result.inspect
puts "\n\n"



products_server = XMLRPC::Client.new2("http://localhost:3001/products_service/api")

puts "Invoke products_service.add_product('My Game', 19.78, 200)"
puts "=========================================================="
puts "  Return:"
result = products_server.call("products_service.add_product", "My Game", 19.78, 200)
puts result.inspect
puts "\n\n"

puts "Invoke products_service.get_product('My Game')"
puts "=============================================="
puts "  Return:"
result = products_server.call("products_service.get_product", "My Game")
puts result.inspect
puts "\n\n"


