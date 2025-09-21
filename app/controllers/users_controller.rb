class UsersController < ApplicationController
    before_action :authenticate_request, except: [:index, :show]
    skip_before_action :authenticate_request, only: [:create]

    def index 
        users = User.all
        render json: users, status: :ok
    end

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

    def profile
        render json: @current_user, status: :ok
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end      
end
