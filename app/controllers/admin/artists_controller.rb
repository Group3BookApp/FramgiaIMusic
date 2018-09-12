module Admin
  class ArtistsController < AdminController
    before_action :load_artist, only: %i(edit show update destroy)

    def index
      @search = Artist.ransack params[:q]
      @artists = @search.result.by_select_artist.page(params[:page]).by_order
        .per Settings.per_page
    end

    def show; end

    def create
      @artist = Artist.new artist_params
      if @artist.save
        flash[:success] = t ".created"
      else
        flash[:danger] = t ".createfail"
      end
      redirect_to admin_artists_url
    end

    def edit; end

    def update
      if @artist.update_attributes artist_params
        flash[:success] = t ".updated"
        redirect_to admin_artists_url
      else
        render :edit
      end
    end

    def destroy
      if !check_song && !check_album
        if @artist.destroy
          flash[:success] = t ".deleted"
        else
          flash[:success] = t ".delete_fail"
        end
      else
        flash[:error] = t ".pls_check"
      end
        redirect_to admin_artists_url
    end

    private

    def load_artist
      @artist = Artist.find_by id: params[:id]
      return if @artist
      flash[:danger] = t ".no_artist"
      redirect_to admin_artists_url
    end

    def check_song
      @artist.songs.present?
    end

    def check_album
      @artist.albums.present?
    end

    def artist_params
      params.require(:artist).permit :name, :avatar, :description
    end
  end
end
