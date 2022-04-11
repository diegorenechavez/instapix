class Api::SessionsController < ApplicationController



    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login(@user)
            render json:["Welcome Back #{@user.firstname.capitalize}!"]
        else 
            render json: ["Incorrect Username or Password"]
        end 
    end


    def destroy
        logout
        render json: ["You have been successfully logged out"]
    end 
end 