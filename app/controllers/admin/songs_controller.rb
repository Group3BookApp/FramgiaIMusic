module Admin
  class SongsController < AdminController
    before_action :load_song, only: %i(destroy show edit update)
    before_action :load_more, only: %i(index edit update)

    def index
      @search = Song.ransack params[:q]
      @songs = @search.result.select_song.page(params[:page]).by_order
        .per Settings.per_page
    end

    def show; end

    def create
      @song = Song.new song_params
      if @song.save
        flash[:success] = t ".created"
      else
        flash[:danger] = t ".createfail"
      end
      redirect_to admin_songs_url
    end

    def edit; end

    def update
      if @song.update_attributes song_params
        flash[:success] = t ".updated"
        redirect_to admin_songs_url
      else
        render :edit
      end
    end

    def destroy
      if @song.destroy
        flash[:success] = t ".deleted"
      else
        flash[:danger] = t ".delete_fail"
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
      params.require(:song).permit :name, :avatar, :data, :album_id,
        :artist_id, :author_id, :category_id
    end

    def load_more
      @author_name = Author.by_name_author
      @album_name = Album.by_name_album
      @artist_name = Artist.by_name_artist
      @category_name = Category.by_name_cate
    end
  end
end
