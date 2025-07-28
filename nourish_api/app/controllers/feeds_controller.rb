class FeedsController < ApplicationController
    def index
        feeds = Feed.all
        render json: feeds, status: :ok
    end

    def show
        feed = Feed.find(params[:id])
        render json: feed, status: :ok
    end

    def create
        feed = Feed.new(feed_params)
        if feed.save
            render json: feed, status: :created
        else
            render json: { errors: feed.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        feed = Feed.find(params[:id])
        if feed.update(feed_params)
            render json: feed, status: :ok
        else
            render json: { errors: feed.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        Feed.find(params[:id]).destroy
        head :no_content
    end

    private

    def feed_params
        params.require(:feed).permit(:baby_id, :user_id, :date, :time, :length, :notes)
    end

end
