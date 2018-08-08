class FpCreatorsController < ApplicationController
    def index
        @fp_creators = FpCreator.new(params[:id])  
    end
        
    def show
        @fp_creators = FpCreator.find(params[:id])
    end
    
end 
