require 'pry'
class ReviewController < ApplicationController
    configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
    end

    get '/books/:id/review' do
        @user = User.find_by_id(session[:user_id])
        @book = Book.find_by_id(params[:id])
        @tags = Tag.all
        erb :'/reviews/new'
    end

    get '/account/reviews' do
        @reviews = Review.where(:user_id => session[:user_id])
        erb :'reviews/index'
    end

    patch '/account/reviews' do
        if !params[:review][:content].empty?
            review = Review.create(params[:review])
        
        else
            redirect to "/books/'#{review.book_id}'/review"
        end

        redirect to '/account/reviews'
    end

    # post '/reviews/:id/edit' do
    #     erb :'reviews/edit'
    # end

    # update '/reviews' do
        
    # end

    delete '/account/reviews' do #destroy
    Review.find_by_id(params[:id]).delete
    redirect to '/account/reviews'
    end
end