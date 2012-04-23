require 'rubygems'
require 'mongo'
require 'json'
require 'net/http'


@con = Mongo::Connection.new
@con.drop_database('opscode')
@db = @con['opscode']
@cookbooks = @db['cookbooks']

url_base = "http://cookbooks.opscode.com/api/v1/cookbooks"

uri = URI.parse(url_base)
http = Net::HTTP::new(uri.host,uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
total_cookbooks = JSON.parse(response.body)["total"]

has_more = true



def total_cookbooks
  # get base url
  uri = URI.parse(url_base)
  http = Net::HTTP::new(uri.host,uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  total_cookbooks = JSON.parse(response.body)["total"]
end
start_at = 0
cookbooks_per_request = 100
stop_at = start_at + cookbooks_per_request +1
cookbook_names = []
puts "Loading #{total_cookbooks} cookbooks"
while (start_at + cookbooks_per_request) < (total_cookbooks + cookbooks_per_request) do
  if start_at != 0
    puts "\n"
  end
  uri = URI.parse("#{url_base}?start=#{start_at}&items=#{cookbooks_per_request}")
  http = Net::HTTP::new(uri.host,uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  items = JSON.parse(response.body)["items"]
  # update the toal
  items.each do |cookbook|
    print "." 
    
    uri = URI.parse("#{url_base}/#{cookbook["cookbook_name"]}")
    http = Net::HTTP::new(uri.host,uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    description = JSON.parse(response.body)

    cookbook = cookbook.merge description
    # write cookbook metadata to mongo
    @cookbooks.insert(cookbook) 
    cookbook_names << cookbook["cookbook_name"]
  end
  
  start_at = start_at + cookbooks_per_request
  stop_at = total_cookbooks
end
puts "\nFinished loading #{total_cookbooks} cookbooks."
