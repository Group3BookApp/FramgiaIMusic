module Admin
  class AuthorsController < AdminController
    before_action :load_author, only: %i(edit show update destroy)

    def index
      @search = Author.ransack params[:q]
      @authors = @search.result.by_select_author.page(params[:page]).by_order
        .per Settings.per_page
    end

    def show; end

    def create
      @author = Author.new author_params
      if @author.save
        flash[:success] = t ".created"
      else
        flash[:danger] = t ".createfail"
      end
      redirect_to admin_authors_url
    end

    def edit; end

    def update
      if @author.update_attributes author_params
        flash[:success] = t ".updated"
        redirect_to admin_authors_url
      else
        render :edit
      end
    end

    def destroy
      if !check_song
        if @author.destroy
          flash[:success] = t ".deleted"
        else
          flash[:success] = t ".delete_fail"
        end
      else
        flash[:error] = t ".pls_check"
      end
        redirect_to admin_authors_url
    end

    private

    def load_author
      @author = Author.find_by id: params[:id]
      return if @author
      flash[:danger] = t ".no_author"
      redirect_to admin_authors_url
    end

    def check_song
      @author.songs.present?
    end

    def author_params
      params.require(:author).permit :name, :avatar, :description
    end
  end
end
