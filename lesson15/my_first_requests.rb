require 'curb'

host_name = 'https://api.chucknorris.io'
path = '/jokes/random'

request = Curl.get(File.join(host_name, path))
