require 'rubygems'
require 'mongo'
require 'json'
require 'net/http'
require 'pp'

@con = Mongo::Connection.new
@db = @con['opscode']
@cookbooks = @db['cookbooks']

# lastest_cookbooks = @cookbooks.find.sort( [["updated_at", -1 ]] )
lastest_cookbooks = @cookbooks.find.sort( [["updated_at", -1 ]] ).limit(40)
open_cookbooks = []
open_users = []
lastest_cookbooks.each do |cb|
  maintainer = cb["cookbook_maintainer"]
  # if cb["cookbook_description"] =~ /windows|microsoft/i || cb["decription"] =~ /windows|microsoft/i
  unless maintainer == "opscode"
  # if maintainer == "tas50"
    # puts " * #{cb["updated_at"]} - #{cb["name"]}"
    # PP.pp(cb)
    # exit 0
    # puts "open http://community.opscode.com/cookbooks/#{cb['name']}"
    # next
    open_cookbooks << cb
    open_users << cb
    name = cb["name"]
    maintainer = cb["cookbook_maintainer"]
    url = "http://community.opscode.com/cookbooks/" + name
    description = cb["description"]
    updated_at = cb["updated_at"]
    latest_version = cb["versions"][0].split("/").pop.gsub("_",".")
    puts "* [#{name}](#{url}) v#{latest_version} - [#{maintainer}](http://community.opscode.com/users/#{maintainer})"
    puts "#{description}"
  end
end

open_cookbooks.each do |open|
  puts "open http://community.opscode.com/cookbooks/#{open["name"]}"
  puts "open http://community.opscode.com/users/#{open["cookbook_maintainer"]}"
end
