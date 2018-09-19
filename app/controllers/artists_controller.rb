class ArtistsController < ApplicationController
  before_action :load_artist, only: %i(show)

  def show
    # @artist = Artist.page(params[:page]).per Settings.page_artist
    @song = Song.all
    @song_artist = Song.select("songs.name").joins(album: :artist).where(artist_id: @artist.id)
    @album_artist = Album.select("albums.name").joins(:artist).where(artist_id: @artist.id)
    @author_song = Song.select("authors.name").joins(:author).where(artist_id: @artist.id)
    @time = Artist.select("date(created_at)").where(artist_id: @artist.id)
  end

  def index
    @artists = Artist.all
  end

  private

  def load_artist
    return if @artist = Artist.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to artists_path
  end

  def load_album
    return if @song_album = Album.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to albums_path
  end
end
