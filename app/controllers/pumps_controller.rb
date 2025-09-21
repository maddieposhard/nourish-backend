class PumpsController < ApplicationController
    before_action :authenticate_request

    def index
        pumps = Pump.where(user_id: @current_user.id)
        render json: pumps, status: :ok
    end

    def show
        pump = Pump.find(params[:id])
        render json: pump, status: :ok
    end

    def create
        pump = Pump.new(pump_params.merge(user_id: @current_user.id))
        if pump.save
            render json: pump, status: :created
        else
            render json: { errors: pump.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        pump = Pump.find(params[:id])
        if pump.update(pump_params)
            render json: pump, status: :ok
        else
            render json: { errors: pump.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        Pump.find(params[:id]).destroy
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
      
        pumps = @current_user.pumps.where(date: date)
        render json: pumps.as_json(only: [:id, :date, :time, :length, :ounces, :notes]), status: :ok
      end
      

    private

    def pump_params
        params.require(:pump).permit(:date, :time, :length, :ounces, :notes)
    end

end
