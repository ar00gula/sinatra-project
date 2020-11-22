class UsersController < ApplicationController
    
get '/users' do
        @users = User.all
        erb :'users/index'
    end
    
    get '/account' do
        if Helpers.current_user(session) == nil
            erb :'users/error'
          else
           @user = User.find_by_id(session[:user_id])
           reviews = Review.where(:user_id => session[:user_id])
           @reviews = reviews.reverse
           @books = Book.where(:user_id => session[:user_id])
           tags = Tag.where(:user_id => session[:user_id])
           @tags = tags.reverse
           erb :'users/show'
          end
    end

    get '/signup' do #new
        if Helpers.is_logged_in?(session)
            erb :'users/loggedin'
        else
            erb :'users/signup'
        end
    end

    post '/signup' do #create
        if !User.find_by_username(params[:username])
        user = User.create(params)
        redirect to '/login'
        else
            @try = "signup"
        erb :'users/signup'
        end
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            erb :'users/loggedin'
        else
            erb :'users/login'
        end
    end

    post "/login" do
        @user = User.find_by(:username => params[:username])
		if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id

			redirect to "/account"
        else
            @try = "login"
            erb :'users/login'
            
            #make it so you get a message saying to try again
		end
    end
    
    get '/logout' do

        session.clear
        redirect to '/'
    
    end

    get '/account/tags' do
        @tags = Tag.where(:user_id == Helpers.current_user(session))
        erb :'users/tags'
    end

    get 'account/books' do
        @books = Book.where(:user_id == Helpers.current_user(session))
        erb :'users/books'
    end

#don't think i actually want this?
    # get '/users/:id' do #show
    #     @user = User.find_by_id(params[:id])
    #     erb :'users/show'
    # end


    

end