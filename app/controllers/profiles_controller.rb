class ProfilesController < ApplicationController
    before_action :set_profile, only:[:show, :edit, :update, :destroy]
    before_action :set_user, only:[:index, :new, :create, :show, :edit, :update, :destroy]

    def index
        @profiles = Profile.all
    end

    def show
    end

    def new
        @profile = Profile.new
    end
     
    def edit
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user = @user
        respond_to do |format|
            if @profile.save
                format.html{redirect_to [@user,@profile]}
                format.json{render:show , status: :created ,location: [@user,@profile]}
            else
                format.html{render :new}
                format.json{render json:@profile.error, status: :unprocessable_entity}
            end
        end
    end

    def update
        respond_to do |format|
            if @profile.update(profile_params)
                format.html{redirect_to [@user,@profile]}
                format.json{render:show , status: :ok ,location: [@user,@profile]}
            else
                format.html{render :edit}
                format.json{render json:@profile.error, status: :unprocessable_entity}
            end
        end
    end

    def destroy
        @profile.destroy
        respond_to do |format|
            format.html{redirect_to profiles_path}
        end
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_profile
        @profile = Profile.find(params[:id])
    end

    def profile_params
        params.require(:profile).permit(:name ,:age ,:sex ,:phone_number)
    end
end
