require 'rubygems'
require 'json'

file = File.open('ohai.out')

json = ''
while line = file.gets
  json += line
end

json = JSON.parse(json)
puts json['virtualization']
puts json['ipaddress']

movies = {one: "terminator".subtitle}
movies[:two] = "batman".
