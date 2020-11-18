class UsersController < ApplicationController

    configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
	end

    get '/signup' do #new
        erb :'users/signup'
    end

    get '/login' do
        erb :'users/login'
    end

    post "/login" do
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect to "/users/#{user.id}"
        else
            redirect to '/login'
            #make it so you get a message saying to try again
		end
	end

    get '/users/:id' do #show
        @user = User.find_by_id(params[:id])
        erb :'users/show'
    end

    post '/signup' do #create
        user = User.create(params)
        redirect to '/login'
    end

end