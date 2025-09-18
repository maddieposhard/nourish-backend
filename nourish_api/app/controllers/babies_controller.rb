class BabiesController < ApplicationController
    before_action :authenticate_request, except: [:index] 

    def index
        babies = Baby.all
        render json: babies, status: :ok
    end

    def my_babies
        babies = @current_user.babies
        render json: babies, status: :ok
    end

    def create
        baby = @current_user.babies.new(baby_params)
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

    def destroy
        baby = Baby.find(params[:id])
        baby.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Baby not found" }, status: :not_found
      end

    private

    def baby_params
        params.require(:baby).permit(:name, :birthdate, :gender, :user_id)
      end
end
