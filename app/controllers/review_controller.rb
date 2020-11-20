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
            Review.create(params[:review])
        end

        stars = StarRating.find_by(:book_id => params[:star_rating][:book_id], :user_id => params[:star_rating][:user_id])
        if !stars
            StarRating.create(params[:star_rating])
        else
            stars.update(params[:star_rating])
        end

        hearts = HeartRating.find_by(:book_id => params[:heart_rating][:book_id], :user_id => params[:heart_rating][:user_id])
        if !hearts
            HeartRating.create(params[:heart_rating])
        else
            hearts.update(params[:heart_rating])
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