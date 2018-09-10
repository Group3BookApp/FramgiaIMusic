class ArtistsController < ApplicationController
  def show
    @artists = Artist.page(params[:page]).per Settings.page_artist
  end

  def index
    @artist = Artist.all
  end

  private

  def artist_params
    params.require(:artist).permit :name, :description
  end
end
