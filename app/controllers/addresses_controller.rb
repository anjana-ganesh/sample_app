class AddressesController < ApplicationController
    before_action :set_params, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    def index
        @addresses = Address.all
    end

    def new
        @address = Address.new
    end

    def edit
    end

    def create
        @address = Address.new(address_params)
        @address.user = @user
        respond_to do |format|
            if @address.save
                format.html{redirect_to [@user, @address]}
                format.json{render :show, status: :created, location: [@user, @address]}
            else
                format.html{render :new}
                format.json{render json:@address.error ,status: :unprocessable_entity}
            end
        end
    end

    def update
        respond_to do |format|
            if @address.update(address_params)
                format.html{redirect_to [@user, @address]}
                format.json{render :show, status: :ok, location: [@user, @address]}
            else
                format.html{render :new}
                format.json{render json:@address.error ,status: :unprocessable_entity}
            end
        end
    end
    
    def destroy
        @address.destroy
        respond_to do |format|
            format.html{redirect_to user_addresses_path}
            format.json{ head:no_content}
        end
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_params
        @address = Address.find(params[:id])
    end

    def address_params
        params.require(:address).permit(:name, :city, :state, :country )
    end
end
