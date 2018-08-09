class FpBackedsController < ApplicationController
    def new
        @fp_backed = FpBacked.new
    end

    def create
        @fp_backed = FpBacked.new(fp_backed_params)
        @fp_backed.save
        redirect_to @fp_backed
    end

    def show
        @fp_backed = FpBacked.find(params[:id])
    end

    private

    def fp_backed_params
        params.require(:fp_backed).permit(pledge_attribute_ids: [], pledge_attributes: [:amount])
    end
end
