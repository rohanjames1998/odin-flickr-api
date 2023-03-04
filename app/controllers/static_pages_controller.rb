class StaticPagesController < ApplicationController
  def home
    if params[:flickr]
      @flickr = Flickr.new
      begin
      @photos = @flickr.people.getPhotos api_key: ENV["FLICKR_API_KEY"], user_id: params[:flickr][:user_id]
      rescue Flickr::FailedResponse
        flash[:notice] = "User not found"
        render :home
      end
    end
  end
end
