class CarsController < ApplicationController
    before_action :set_car, only:[:show, :edit, :update, :destroy]
    def index
        @cars= Car.all
    end

    def show
    end

    def new
        @car= Car.new
    end

    def edit
    end

    def create
        @car= Car.new(car_params)
        respond_to do |format|
            if @car.save
                format.html{redirect_to @car}
            else
                format.hrml{render:new}
            end
        end
    end

    def update
        respond_to do |format|
            if @car.update(car_params)
                format.html{redirect_to @car}
            else
                format.html{render:edit}
            end
        end
    end

    def destroy
        @car.destroy
        respond_to do |format|
            format.html{redirect_to @car}
        end
    end

    private

    def set_car
        @car= Car.find(params[:id])
    end

    def car_params
        params.require(:car).permit(:brand, :model, :registration_number, :colour )
    end


end
