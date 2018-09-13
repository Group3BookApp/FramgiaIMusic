module Admin
  class AlbumsController < AdminController
    before_action :load_album, only: %i(edit show update destroy)
    before_action :load_artist, only: %i(index edit update)
    def index
      @search = Album.ransack params[:q]
      @albums = @search.result.by_select_album.page(params[:page]).by_order
        .per Settings.per_page
    end

    def show; end

    def create
      @album = Album.new album_params
      if @album.save
        flash[:success] = t ".created"
      else
        flash[:danger] = t ".createfail"
      end
      redirect_to admin_albums_url
    end

    def edit; end

    def update
      if @album.update_attributes album_params
        flash[:success] = t ".updated"
        redirect_to admin_albums_url
      else
        render :edit
      end
    end

    def destroy
      if !check_song
        if @album.destroy
          flash[:success] = t ".deleted"
        else
          flash[:success] = t ".delete_fail"
        end
      else
        flash[:error] = t ".pls_check"
      end
        redirect_to admin_albums_url
    end

    private

    def load_album
      @album = Album.find_by id: params[:id]
      return if @album
      flash[:danger] = t ".no_album"
      redirect_to admin_albums_url
    end

    def load_artist
      @artist_name = Artist.by_name_artist
    end

    def check_song
      @album.songs.present?
    end

    def album_params
      params.require(:album).permit :name, :avatar, :artist_id, :description
    end
  end
end
