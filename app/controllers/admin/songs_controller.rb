module Admin
  class SongsController < AdminController

    def index
      @songs = Song.select_song.page(params[:page]).by_order
        .per Settings.per_page
    end

    def create
      @song = Song.new song_params
      if @song.save
        flash[:success] = t ".created"
      else
        flash[:danger] = t ".createfail"
      end
      redirect_to admin_songs_url
    end

    private

    def load_song
      @song = Song.find_by id: params[:id]
      return if @song
      flash[:danger] = t ".no_song"
      redirect_to admin_songs_url
    end

    def song_params
      params.require(:song).permit :name, :avatar, :data
    end
  end
end
