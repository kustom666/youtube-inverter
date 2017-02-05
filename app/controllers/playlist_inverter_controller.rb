class PlaylistInverterController < ApplicationController
  def index
    @auth_link = Yt::Account.new(scopes: ["youtube"], redirect_uri: "http://localhost:3000/invert").authentication_url
  end
  def invert_index
    @code = params[:code]
  end
  def invert_now
    Yt.configure do |config| config.log_level = :debug end
    @account = Yt::Account.new authorization_code: params[:playlist_data][:code], redirect_uri: "http://localhost:3000/invert"
    playlist = Yt::Playlist.new url: params[:playlist_data][:playlist_url]
    ids = Array.new
    @inverted_playlist = @account.create_playlist title: "#{playlist.title} inverted by ytinverter"
    playlist.playlist_items.each do |item|
      ids.push item.video.id
    end

    ids.reverse.each do |id|
      @inverted_playlist.add_video id
    end
  end
end
