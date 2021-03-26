class SessionsController < ApplicationController

    def new
    end

    def show
    end

    def create
        if !params[:user][:name] || params[:user][:name].empty? ||!params[:user][:password] || params[:user][:password].empty? 
            redirect_to '/login'
        else
            user = User.find_by(name: params[:user][:name])
            return head(:forbidden) unless user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to '/'
        end
    end

    def destroy
        if session[:name]
            session.delete :name
        end
    end
end
