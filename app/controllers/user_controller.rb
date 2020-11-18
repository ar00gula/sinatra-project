require_relative '../../config/environment'
class UsersController < ApplicationController

    configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
    end

    get '/users' do
        @users = User.all
        erb :'users/index'
    end
    
    get '/account' do
        if Helpers.current_user(session) == nil
            erb :'users/error'
          else
           @user = User.find_by_id(session[:user_id])
           erb :'users/show'
          end
    end

    get '/signup' do #new
        erb :'users/signup'
    end

    post '/signup' do #create
        user = User.create(params)
        redirect to '/login'
    end

    get '/login' do
        erb :'users/login'
    end

    post "/login" do
        @user = User.find_by(:username => params[:username])
		if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id

			redirect to "/account"
        else
            redirect to '/login'
            #make it so you get a message saying to try again
		end
    end
    
    get '/logout' do

        session.clear
        redirect to '/'
    
    end

#don't think i actually want this?
    # get '/users/:id' do #show
    #     @user = User.find_by_id(params[:id])
    #     erb :'users/show'
    # end


    

end