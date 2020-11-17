class TagsController < ApplicationController

    get '/tags' do
        @tags = Tag.all
        erb :'tags/index'
    end

    get '/tags/new' do #new
        @tags = Tag.all
        erb :'tags/new'
    end

    post '/tags' do #create
        tag = Tag.create(params[:tag])
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
        tag.update(params[:tag])
        
        redirect to "tags/#{tag.id}"
    end

    delete '/tags' do #destroy
        tag = Tag.find_by_id(params[:id])
        tag.delete

        redirect to "/tags"
    end

end