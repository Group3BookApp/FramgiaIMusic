module Admin
  class CategoriesController < AdminController
    before_action :load_category, only: %i(edit show update destroy)

    def index
      @search = Category.ransack params[:q]
      @categories = @search.result.by_select_category.page(params[:page]).by_order
        .per Settings.per_page
    end

    def create
      @category = Category.new category_params
      if @category.save
        flash[:success] = t ".created"
      else
        flash[:danger] = t ".createfail"
      end
      redirect_to admin_categories_url
    end

    def show; end

    def edit; end

    def update
      if @category.update_attributes category_params
        flash[:success] = t ".updated"
        redirect_to admin_categories_url
      else
        render :edit
      end
    end

    def destroy
      if !check_song
        if @category.destroy
          flash[:success] = t ".deleted"
        else
          flash[:success] = t ".delete_fail"
        end
      else
        flash[:error] = t ".pls_check"
      end
      redirect_to admin_categories_url
    end

    private

    def load_category
      @category = Category.find_by id: params[:id]
      return if @category
      flash[:danger] = t ".no_author"
      redirect_to admin_categories_url
    end

    def check_song
      @category.songs.present?
    end

    def category_params
      params.require(:category).permit :name, :description
    end
  end
end
