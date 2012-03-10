require 'rubygems'
require 'mongo'
require 'json'
require 'net/http'


@con = Mongo::Connection.new
@con.drop_database('opscode')
@db = @con['opscode']
@cookbooks = @db['cookbooks']

lastest_cookbooks = @cookbooks.find(

puts "Find the latest cookbooks using db.cookbooks.find({}, {cookbook_name: 1, cookbook_maintainer:1,updated_at:1}).sort({updated_at:-1})"

