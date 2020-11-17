class BooksController < ApplicationController

    get '/books' do
        @books = Book.all
        erb :'books/index'
    end

   get '/books/new' do
        @tags = Tag.all
        erb :'books/new'
    end

    get '/books/:id' do
        @book = Book.find_by_id(params[:id])
        erb :'books/show'
    end

    post '/books' do
        book = Book.create(params[:book])
        tag = Tag.create(params[:tag])
        BookTag.create(book_id: book.id, tag_id: tag.id)
    end
 
end