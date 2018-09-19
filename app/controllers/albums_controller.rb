class AlbumsController < ApplicationController
  before_action :load_album, only: :show

  def show
    @list_song = Song.select("songs.name").joins(album: :artist).where(album_id: @song_album.id).all
  end

  def index
    @song_album = Album.page(params[:page]).per Settings.page_album
  end

  private

  def album_params
    params.require(:album).permit :name, :description
  end

  def load_album
    return if @song_album = Album.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to albums_path
  end
end
