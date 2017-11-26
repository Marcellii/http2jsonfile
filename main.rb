# frozen_string_literal: true

# sinatra.rb
require 'sinatra'
require 'json'

get '/json' do
return 200, JSON.Pretty_generate(get_hashtags)
end

post '/json' do
#	"Hello #{params[:hashtags]}"
  body = JSON.parse(request.body.read)
  hashtags = body['hashtags']
  write_hashtags(hashtags) if hashtags
  return 200, JSON.pretty_generate(get_hashtags)
end

delete '/json' do
  File.rename 'hashtags.json', "hashtags.#{Time.new}.json"
  file = File.open('hashtags.json', 'w')
  file.close
  return 200, JSON.pretty_generate(get_hashtags)
end

def write_hashtag(hashtag)
  all_hashtags = get_hashtags
  all_hashtags['hashtags'] << hashtag
  all_hashtags['hashtags'].uniq!
  file = File.open('hashtags.json', 'w+')
  puts all_hashtags
  file.write(JSON.pretty_generate(all_hashtags))
  file.close
end

def write_hashtags(hashtags)
  hashtags.each do |hashtag|
    write_hashtag(hashtag)
  end
end

#get "/" do
#%q{
#	<button onclick="gethashtags()">Get Hashtags</button>
#	<script>
#	function gethashtags() {
#	get '/json' do
#	return200, JSON.Pretty_generate(get_hashtags)
#	end
#	}
#	</script>
#}
#end

get '/' do
%q{
	<form method="post" action="/json">>
	<p> Enter here your hashtags: <input type ="text" name ="hashtagform"></p>
	<input type="submit">
	</form>

}

end

def get_hashtags
  File.exist?('hashtags.json') ? JSON.parse(File.read('hashtags.json')) : { 'hashtags' => [] }
end
