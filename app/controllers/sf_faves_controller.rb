class SfFavesController < ApplicationController
    before_action :require_login

    def index
        @sf_faves = SfFafe.all
    end
    
    def new
        @sf_fafe = SfFafe.new
    end
    
    def create
        @sf_fafe = SfFafe.new(sf_fafe_params)
        if @sf_fafe.valid?
          @sf_fafe.save
          redirect_to sf_fafe_path(@sf_fafe)
        else
          render :new
        end
    end
          
    def show
        @pledge = Pledge.find(params[:id])
    end
    
    def edit
      end
    
      def update
      end
    
      def destroy
      end

private

def sf_fafe_params
    params.require(:sf_fafe).permit(:user_id, :fav_lit, :fav_film, :fav_game)
  end


    def require_login
        unless logged_in?
            flash[:alert] = "You must be logged in to access this section"
            redirect_to login_path
        end
    end
end