class StaticPagesController < ApplicationController
  def index
    @flickr = Flickr.new
    @user_id = id_param[:user_id]

    begin
      @photos = @flickr.people.getPhotos(user_id: @user_id.strip)
    rescue
      flash.now[:error] = "#{@user_id} not found!"
      render :index
    end
  end

  private

  def id_param
    params.permit(:user_id, :commit)
  end
end
