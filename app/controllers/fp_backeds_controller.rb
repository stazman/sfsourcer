class FpBackedsController < ApplicationController
    def new
        @fp_backed = FpBacked.new
    end

    def create
        @fp_backed = FpBacked.create(fp_backed_params)
    end

    def show
        @fp_backed = FpBacked.find(params[:id])
    end

    private

    def fp_backed_params
        params.require(:fp_backed).permit(pledge_attribute_ids: [], pledge_attributes: [:amount])
    end
end
