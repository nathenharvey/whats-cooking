require 'rubygems'
require 'mongo'
require 'json'
require 'net/http'


@con = Mongo::Connection.new
@db = @con['opscode']
@cookbooks = @db['cookbooks']

# lastest_cookbooks = @cookbooks.find.sort( [["updated_at", -1 ]] )
lastest_cookbooks = @cookbooks.find.sort( [["updated_at", -1 ]] ).limit(50)
open_cookbooks = []
open_users = []
lastest_cookbooks.each do |cb|
  maintainer = cb["cookbook_maintainer"]
  unless maintainer == "opscode"
    open_cookbooks << cb
    open_users << cb
    name = cb["name"]
    maintainer = cb["cookbook_maintainer"]
    url = "http://community.opscode.com/cookbooks/" + name
    description = cb["description"]
    updated_at = cb["updated_at"]
    latest_version = cb["versions"][0].split("/").pop.gsub("_",".")
    puts "### [#{name}](#{url}) v#{latest_version} - [#{maintainer}](http://community.opscode.com/users/#{maintainer})"
    puts "  * #{description}"
    puts "  * #{updated_at}"
  end
end

open_cookbooks.each do |open|
  puts "open http://community.opscode.com/cookbooks/#{open["name"]}"
  puts "open http://community.opscode.com/users/#{open["cookbook_maintainer"]}"
end
