class FundingCategories < ApplicationController

    before_action :require_login
    
    def index
        @funding_categories = FundingCategories.all
    end

    def new
        @funding_category = FundingCategory.new
    end

    def create
        @funding_category = FundingCategory.new(funding_category_params)
    #   @funding_category.user_id = current_user.id
        @funding_category.funding_project_id = params[:funding_category][:funding_project_id] 
        if @funding_category.valid?
            @funding_category.save
            redirect_to funding_category_path(@funding_category)
        else
            render :new
        end
    end
        

    def show
        @funding_category = FundingCategory.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def funding_category_params
        params.require(:funding_category).permit(:name)
    end

    def require_login
        unless logged_in?
            flash[:alert] = "You must be logged in to access this section"
            redirect_to login_path
        end
    end
end

