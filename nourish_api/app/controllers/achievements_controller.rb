class AchievementsController < ApplicationController
    def index
        achievements = Achviement.all
        render json: achievements, status: :ok
    end

    def show
        achievement = Achievment.find(params[:id])
        render json: achievement, status: :ok
    end

    def create
        achievement = Achievment.new(achievement_params)
        if achievement.save
            render json: achievement, status: :created
        else
            render json: { errors: achievement.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        achievement = Achievment.find(params[:id])
        if achievement.update(achievement_params)
            render json: achievement, status: :ok
        else
            render json: { errors: achievement.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        Achievment.find(params[:id]).destroy
        head :no_content
    end

    private
    
    def achievement_params
        params.require(:achievement).permit(:user_id, :title, :description)
    end
end
