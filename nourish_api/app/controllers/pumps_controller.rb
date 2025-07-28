class PumpsController < ApplicationController
    def index
        pumps = Pump.all
        render json: pumps, status: :ok
    end

    def show
        pump = Pump.find(params[:id])
        render json: pump, status: :ok
    end

    def create
        pump = Pump.new(pump_params)
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

    private

    def pump_params
        params.require(:pump).permit(:user_id, :date, :time, :length, :ounces, :notes)
    end

end
