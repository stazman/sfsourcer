class FundingCategories < ApplicationController

    before_action :require_login
    
    def index
        @funding_categories = FundingCategories.all
    end

    def show
        @funding_category = FundingCategory.find(params[:id])
    end

private 

    def require_login
        unless logged_in?
            flash[:alert] = "You must be logged in to access this section"
            redirect_to login_path
        end
    end
end

