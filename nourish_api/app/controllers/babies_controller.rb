class BabiesController < ApplicationController

    private
    
    def baby_params
        params.require(:baby).permit(:baby_id, :name)
    end
end
