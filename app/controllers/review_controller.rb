class ReviewController < ApplicationController
    
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

    post '/account/reviews' do
        if params[:review][:content].empty? && (params[:review][:stars].empty? || params[:review][:hearts].empty?)
            redirect "/books/#{params[:review][:book_id].to_i}/review"
        
        else
            review = Review.create(params[:review])
        end

        redirect to "/books/#{review.book_id}"
    end

    patch '/account/reviews' do
        review = Review.find(params[:review][:id])
        review.update(params[:review])
        redirect to 'account/reviews'
    end

    get '/reviews/:id/edit' do

        @review = Review.find_by_id(params[:id])
        @book = @review.book
        erb:'/reviews/edit'
    end

    get '/books/:id/reviews' do

        @reviews = Review.where(:book_id => params[:id])
        @book = Book.find_by_id(params[:id])
        erb :'/reviews/show'
    end


    delete '/account/reviews' do #destroy
    Review.find_by_id(params[:id]).delete
    redirect to '/account/reviews'
    end

end