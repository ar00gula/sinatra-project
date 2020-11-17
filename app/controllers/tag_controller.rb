class TagsController < ApplicationController

    get '/tags' do
        @tags = Tag.all
        erb :'tags/index'
    end

end