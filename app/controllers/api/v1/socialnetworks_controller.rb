class Api::V1::SocialnetworksController < ApplicationController

  def make_api_response
    @response = Socialnetwork.new.api_call
    render json: @response, status: 200
  end

end
