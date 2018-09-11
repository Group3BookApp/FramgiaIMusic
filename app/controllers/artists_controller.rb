class ArtistsController < ApplicationController
  before_action :load_artist, only: :show

  def show
    @song_artist = Song.select("songs.name").joins(album: :artist).where(artist_id: @artist_song.id).all
    @album_artist = Album.select("albums.name").joins(:artist).where(artist_id: @artist_song.id).all
    @author_song = Song.select("authors.name").joins(:author).where(artist_id: @artist_song.id).all
    @time = Artist.select("date(created_at)").where(artist_id: @artist_song.id)
  end

  def index
    @artist_song = Artist.page(params[:page]).per Settings.page_artist
    @category_artist = Song.select("categories.name").joins(:category, :artist).group("categories.name").all
    @list_artist = Artist.joins(:category).where(category_id: :id).group("categories.name")
  end

  private

  def artist_params
    params.require(:artist).permit :name, :description
  end

  def load_artist
    return if @artist_song = Artist.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to artists_path 
  end

  def load_album
    return if @song_album = Album.find_by(id: params[:id])
    flash[:danger] = t ".not_found"
    redirect_to albums_path 
  end
end
