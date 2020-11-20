require 'pry'
class BooksController < ApplicationController
    configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
	end


    get '/books' do #index
        @books = Book.all

        erb :'books/index'
    end

    get '/books/new' do #new
        @tags = Tag.all
        erb :'books/new'
    end

    get '/books/:id' do #show
        @book = Book.find_by_id(params[:id])
        @reviews = Review.where(:book_id => @book.id)
        
        erb :'books/show'
    end

    post '/books' do #create
        book = Book.create(params[:book])
        tag = Tag.create(params[:tag])
        BookTag.create(book_id: book.id, tag_id: tag.id)
    end

    get '/books/:id/edit' do #edit
        @user = User.find_by_id(session[:user_id])
        @book = Book.find_by_id(params[:id])
        @tags = Tag.all
        erb :'books/edit'
    end

    post '/tags' do
        tag = Tag.create(params[:tag])
        book = Book.find_by_id(params[:id])
        book.tags << tag

        redirect to "/books/#{params[:id]}/edit"
    end

    patch '/books/:id' do #update
    if session[:user_id] == 1
        book = Book.find_by_id(params[:id])
        book.update(params[:book])
        #i am knowingly going into this knowing that i can overwrite the title, author, and summary way too easily, but that's a problem for later!
        # if !params[:tag][:name].empty?
        #     tag = Tag.create(params[:tag])
        #     book.tags << tag
        #     book.save
        # end

        if !params[:img_url].empty?
            book.img_url = params[:img_url]
            book.save
        end
    else
        # this whole bit is borked and i am too sleppy to keep going on it. i need to make it so that a user can add tags, remove tags that they created, but not remove tags they did not create
        # book = Book.find_by_id(params[:id])
        # if book.tags
        #     params[:book][:tag_ids].each do |tag_id|                
        #     if !book.tags.include?(Tag.find_by_id(tag_id))
        #         book.tags << Tag.find_by_id(tag_id)
        #     end
        #     book.tags.each do |book_tag|
        #         if !params[:book][:tag_ids].include?(book_tag.id) && book_tag.user_id == session[:user_id]
        #             book_tag.delete
        #         end
        #     end
        #     book.save
        #     end
        # else
        #     book.update(params[:book])
        # end
    end
        redirect to "/books/#{book.id}"
    end

    delete '/books/:id' do #destroy
        book = Book.find_by_id(params[:id])
        book.delete
        redirect to '/books'
    end
 
end