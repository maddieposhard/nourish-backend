class FeedsController < ApplicationController
    before_action :authenticate_request

    def index
        feeds = Feed.where(user_id: @current_user.id)
        render json: feeds, status: :ok
    end

    def show
        feed = Feed.find(params[:id])
        render json: feed, status: :ok
    end

    def create
        feed = Feed.new(feed_params.merge(user_id: @current_user.id))
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

    def by_date
        unless params[:date].present?
          return render json: { error: "Missing date parameter" }, status: :bad_request
        end
      
        begin
          date = Date.parse(params[:date])
        rescue ArgumentError
          return render json: { error: "Invalid date format" }, status: :unprocessable_entity
        end
      
        feeds = @current_user.feeds.where(date: date)
        render json: feeds.as_json, status: :ok
      end

    private

    def feed_params
        params.require(:feed).permit(:baby_id, :date, :time, :length, :ounces, :feed_type, :notes)
    end

end
