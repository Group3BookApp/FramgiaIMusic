class SongsController < ApplicationController
  before_action :load_song, only: :show

  def index
    @songs = Song.select_song.page(params[:page]).by_order.per Settings.per_page
  end

  def show; end

  private

  def load_song
    @song = Song.find_by id: params[:id]
  end
end
