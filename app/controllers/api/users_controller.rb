class Api::UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save 
            render json: @user
        else 
            render json: @user.errors.full_messages
        end 
    end 

    def update 
        given_id = params[:id]
        @user = User.find_by(id: given_id )
        if @user.update(user_params)
            render json: @user
        else 
            render json: @user.errors.full_messages
        end 
    end 

    def destroy
        given_id = params[:id]
        @user = User.find_by(id: given_id )
        if @user.delete 
            render json: ["We are sorry to see you go #{@user.firstname.capitalize}!"]
        else 
            render json: ["There was a problem processing your request."]
        end 
    end 






    private 
    def user_params
        params.require(:user).permit(:username,:password,:email,:age,:firstname, :lastname)
    end 
end
