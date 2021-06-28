class Socialnetwork < ApplicationRecord
  require 'rest-client'

  def api_call
    url_list = [ENV['TWITTER_URL'], ENV['FACEBOOK_URL'], ENV['INSTAGRAM_URL']]
    response = data_fetch(url_list)
    response
  end


  private

  def data_fetch(array)
    api_info_to_consume = Hash.new
    @social_media_name = ''
    @key = ''

    array.each do |url|
      get_sm_name_and_key(url)
      begin
        response = RestClient::Request.execute(method: :get, url: url, timeout: 10000, open_timeout: 10000)
      rescue RestClient::NotFound => err
        puts "With have the this error #{err.response} in the #{@social_media_name} API call"
        api_info_to_consume[@social_media_name] = "Sorry, we can't found this data"
        next
      rescue RestClient::InternalServerError
        api_info_to_consume[@social_media_name] = "the data is not available, please try again later"
        next
      else
        puts "The #{@social_media_name} API call worked!"
        data_json = JSON.parse(response)
        data_json.map!{|item| item[@key]}
        api_info_to_consume[@social_media_name] = data_json
      end
    end
    puts api_info_to_consume
    api_info_to_consume
  end


  def get_sm_name_and_key(url)
    case
    when url.include?('twitter')
      @social_media_name = 'twitter'
      @key = 'tweet'
    when url.include?('facebook')
      @social_media_name = 'facebook'
      @key = 'status'
    when url.include?('instagram')
      @social_media_name = 'instagram'
      @key = 'photo'
    else @social_media_name = 'is not a valid social media'
    end


  end



end
