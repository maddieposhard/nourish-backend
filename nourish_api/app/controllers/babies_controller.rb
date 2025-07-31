class BabiesController < ApplicationController
    def create
        baby = Baby.new(baby_params)
        if baby.save
            render json: baby, status: :created
        else
            render json: { errors: baby.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        baby = Baby.find(params[:id])
        render json: baby, status: :ok
    end

    private

    def baby_params
        params.require(:baby).permit(:user_id, :name)
    end
end
