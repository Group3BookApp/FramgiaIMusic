class SongsController < ApplicationController
  before_action :load_song, only: :show

  def index
    @songs = Song.select_song.page(params[:page]).by_order.per Settings.per_page
  end

  def show
    @song.increase_listening
    if @song.lyrics.present?
      @song_lyrics = @song.lyrics.all
    end
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
    return if @song
    flash[:danger] = t ".no_song"
    redirect_to songs_url
  end
end
