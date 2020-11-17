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
end