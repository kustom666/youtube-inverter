class PlaylistInverterController < ApplicationController
  def index
    @auth_link = Yt::Account.new(scopes: ["youtube"], redirect_uri: "#{ENV["BASE_REDIRECT_URI"]}/invert").authentication_url
  end
  def invert_index
    @code = params[:code]
  end
  def invert_now
    match_pl = /playlist\?list=.+/.match(params[:playlist_data][:playlist_url])
    if !match_pl
      flash[:error] = "The format of the playlist url is incorrect"
      render :index
    else
      @account = Yt::Account.new authorization_code: params[:playlist_data][:code], redirect_uri: "#{ENV["BASE_REDIRECT_URI"]}/invert"
      playlist = Yt::Playlist.new url: params[:playlist_data][:playlist_url]
      ids = Array.new
      @inverted_playlist = @account.create_playlist title: "#{playlist.title} inverted by #{ENV["BASE_REDIRECT_URI"]}"
      playlist.playlist_items.each do |item|
        ids.push item.video.id
      end

      ids.reverse.each do |id|
        @inverted_playlist.add_video id
      end
    end
  end
end
