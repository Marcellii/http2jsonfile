# frozen_string_literal: true

# sinatra.rb
require 'sinatra'
require 'json'

get '/json' do
  return 200, JSON.pretty_generate(get_hashtags)
end

post '/json' do
  body = JSON.parse(request.body.read)
  hashtags = body['hashtags']
  write_hashtags(hashtags) if hashtags
  return 200, JSON.pretty_generate(get_hashtags)
end

delete '/json' do
  file = File.open('hashtags.json', 'w')
  file.close
  File.rename 'hashtags.json', "hashtags.#{Time.new}.json"
  return 200, JSON.pretty_generate(get_hashtags)
end

def write_hashtag(hashtag)
  all_hashtags = get_hashtags
  puts all_hashtags
  #all_hashtags['hashtags'].empty? ? all_hashtags['hashtags'] = hashtag : all_hashtags['hashtags'] << hashtag
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

def get_hashtags
  File.exist?('hashtags.json') ? JSON.parse(File.read('hashtags.json')) : { "hashtags" => [] }
end
