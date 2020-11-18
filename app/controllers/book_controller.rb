require 'pry'
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
        tag = Tag.create(params[:tag])
        BookTag.create(book_id: book.id, tag_id: tag.id)
    end

    get '/books/:id/edit' do #edit
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

        redirect to "/books/#{book.id}"
    end

    delete '/books/:id' do #destroy
        book = Book.find_by_id(params[:id])
        book.delete
        redirect to '/books'
    end
 
end