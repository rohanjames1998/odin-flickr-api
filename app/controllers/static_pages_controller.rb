class StaticPagesController < ApplicationController
  def home
    if params[:flickr]
      flickr = Flickr.new
      @photos = flickr.people.getPhotos api_key: ENV["FLICKR_API_KEY"], user_id: params[:flickr][:user_id]
    end
  end
end
