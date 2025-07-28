class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user, status: :ok
    end

    private
    
    def user_params
      params.permit(:user_id, :email, :name, :password, :password_confirmation)
    end
end
