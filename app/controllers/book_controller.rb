class BooksController < ApplicationController

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
        erb :'books/show'
    end

    post '/books' do #create
        book = Book.create(params[:book])
        book.user_id = session[:user_id]
        book.save
        
        redirect to '/books'
    end

    get '/books/:id/edit' do #edit
        if Helper.is_logged_in?
            @user = User.find_by_id(session[:user_id])
            @book = Book.find_by_id(params[:id])
            @tags = Tag.all
            erb :'books/edit'
        else
            erb :'users/error'
        end
    end

    patch '/books/:id' do #update
    if session[:user_id] == 1
        book = Book.find_by_id(params[:id])
        book.update(params[:book])

        if !params[:img_url].empty?
            book.img_url = params[:img_url]
            book.save
        end
    else
        book = Book.find_by_id(params[:id])
        if book.tags
            params[:book][:tag_ids].each do |tag_id|                
            if !book.tags.find_by_id(tag_id)
                book.tags << Tag.find_by_id(tag_id)
            end
            book.tags.each do |tag|
                if !params[:book][:tag_ids].include?(tag.id.to_s) && tag.user_id == session[:user_id]
                    book.tags - [tag]
                    if BookTag.find_by(:tag_id => tag.id, :book_id => book.id)
                    BookTag.find_by(:tag_id => tag.id, :book_id => book.id).destroy
                    end
                end
            end
            book.save
            end
        end
    end
        redirect to "/books/#{book.id}"
    end

    delete '/books/:id' do #destroy
        book = Book.find_by_id(params[:id])
        book.delete
        redirect to '/books'
    end
 
end