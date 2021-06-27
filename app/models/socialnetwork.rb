class Socialnetwork < ApplicationRecord
  require 'rest-client'

  def get_data_twitter
    response = data_fetch(ENV['TWITTER_URL'], 'twitter')
    find_the_hash_property(response, 'tweet')
  end

  def get_data_facebook
    response = data_fetch(ENV['FACEBOOK_URL'], 'facebook')
    find_the_hash_property(response, 'status')
  end

  def get_data_instagram
    response = data_fetch(ENV['INSTAGRAM_URL'], 'instagram')
    find_the_hash_property(response, 'photo')
  end

  def api_call
    api_info_to_consume = Hash.new
    api_info_to_consume["twitter"] = get_data_twitter
    api_info_to_consume["facebook"] = get_data_facebook
    api_info_to_consume["instagram"] = get_data_instagram
    puts api_info_to_consume
    api_info_to_consume
  end

  private

  def data_fetch(url, social_media_name)
    begin
      response = RestClient::Request.execute(method: :get, url: url, timeout: 5000, open_timeout: 5000)
    rescue RestClient::NotFound => err
      puts "With have the this error #{err.response} in the #{social_media_name} API call"
      return 404
    else
      puts "The #{social_media_name} API call worked!"
      return JSON.parse(response)
    end
  end

  def find_the_hash_property(data, property_name)
    if data == 404
      "The data is not available"
    else
      data = data.map{|x| x[property_name]}
    end
  end
end
