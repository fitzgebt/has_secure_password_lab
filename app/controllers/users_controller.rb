class UsersController < ApplicationController


    def new
    end

    def create
        if params[:user][:password] != params[:user][:password_confirmation]
            redirect_to '/users/new'
        else
            user = User.find_or_create_by(name: params[:user][:name]) do |u|
                u.password = params[:user][:password]
                u.password_confirmation = params[:user][:password_confirmation]
                u.save
            end
            session[:user_id] = user.id
        end
    end

    def show
    end

    def destroy
    end

    private

end
