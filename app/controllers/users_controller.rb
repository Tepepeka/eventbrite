class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to @user, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end    

    def destroy
        @user.destroy
        redirect_to root_path, status: :see_other, notice: "User was successfully destroyed."
    end

    #######
    private
    #######

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name)
    end

end