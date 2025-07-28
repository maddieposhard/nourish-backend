class BottleFeedsController < ApplicationController
    def index
        bottle_feeds = Bottle_feed.all
        render json: bottle_feeds, status: :ok
    end

    def show
        bottle_feed = Bottle_feed.find(params[:id])
        render json: bottle_feed, status: :ok
    end

    def create
        bottle_feed = Bottle_feed.new(bottle_feed_params)
        if bottle_feed.save
            render json: bottle_feed, status: :created
        else
            render json: { errors: bottle_feed.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        bottle_feed = Bottle_feed.find(params[:id])
        if bottle_feed.update(bottle_feed_params)
            render json: bottle_feed, status: :ok
        else
            render json: { errors: bottle_feed.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        Bottle_feed.find(params[:id]).destroy
        head :no_content
    end

    private

    def bottle_feeds_params
        params.require(:bottle_feeds).permit(:baby_id, :date, :time, :ounces, :notes)
    end
end
