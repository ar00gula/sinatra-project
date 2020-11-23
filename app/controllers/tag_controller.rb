class TagsController < ApplicationController
    
get '/tags' do
        @tags = Tag.all
        erb :'tags/index'
    end

    get '/tags/new' do #new
        @tags = Tag.all
        erb :'tags/new'
    end

    post '/tags' do
        if !Tag.find_by(:name => params[:tag][:name].downcase)
            tag = Tag.create(params[:tag])
            tag.name = tag.name.downcase
            tag.save
        else
            @message = "Tag already exists. Please try again!"

        end
        book = Book.find_by_id(params[:id])
        if book
            book.tags << tag
            redirect to "/books/#{params[:id]}/edit"
        else 
            @tags = Tag.all
            erb :'/tags/index'
        end
    end

    get '/tags/:id' do
        @books = Book.all
        @tag = Tag.find_by_id(params[:id])
        #definitely want to be able to have slugs as urls here
        erb :'tags/show'
    end

    get '/tags/:id/edit' do #edit
        @tag = Tag.find_by_id(params[:id])
        erb :'tags/edit'
    end

    patch '/tags/:id' do #update
        tag = Tag.find_by_id(params[:id])
        if tag.user_id == session[:user_id] || session[:user_id] == 1
            if params[:tag][:name] != ""
                tag.update(params[:tag])
            end
        end

        redirect to "tags/#{tag.id}"
    end

    delete '/tags' do #destroy
        tag = Tag.find_by_id(params[:id])
        if tag.user_id == session[:user_id] || session[:user_id] == 1
        tag.delete
        end

        redirect to "/tags"
    end

end