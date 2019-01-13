class FpCreatorsController < ApplicationController
    def index
        @fp_creators = FpCreator.new(params[:id])  
        render :layout => 'navbar_on_top'
    end
        
    def show
        @fp_creators = FpCreator.find(params[:id])
        render :layout => 'navbar_on_top'
    end
    
end 
