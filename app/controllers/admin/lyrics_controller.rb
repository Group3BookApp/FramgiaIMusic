module Admin
  class LyricsController < AdminController
    before_action :load_lyric, only: %i(edit update destroy)
    before_action :load_more, only: %i(index edit update)

    def index
      @search = Lyric.ransack params[:q]
      @lyrics = @search.result.by_select_lyric.page(params[:page]).by_order
        .per Settings.per_page
    end

    def show; end

    def edit; end

    def create
      @lyric = Lyric.new lyric_params
      if @lyric.save
        flash[:success] = t ".created"
      else
        flash[:danger] = t ".createfail"
      end
      redirect_to admin_lyrics_url
    end

    def update
      if @lyric.update_attributes lyric_params
        flash[:success] = t ".updated"
        redirect_to admin_lyrics_url
      else
        render :edit
      end
    end

    def destroy
      #if !check_song && !check_album
        if @lyric.destroy
          flash[:success] = t ".deleted"
        else
          flash[:success] = t ".delete_fail"
        end
      # else
      #   flash[:error] = t ".pls_check"
      # end
        redirect_to admin_lyrics_url
    end

    private

    def load_lyric
      @lyric = Lyric.find_by id: params[:id]
      return if @lyric
      flash[:danger] = t "admin.lyrics.not_found"
      redirect_to admin_lyrics_url
    end

    def lyric_params
      params.require(:lyric).permit :content, :status, :song_id, :user_id
    end

    def load_more
      @song_name = Song.by_name_song
      @user_name = User.by_name_user
    end
  end
end
