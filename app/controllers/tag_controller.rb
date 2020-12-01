class TagsController < ApplicationController
    
    get '/tags' do
        @tags = Tag.all
        erb :'tags/index'
    end

    get '/tags/new' do #new
        if Helpers.is_logged_in?(session)
            @tags = Tag.all
            erb :'tags/new'
        else
            erb :'users/error'
        end
    end

    post '/tags' do 
        if Helpers.is_logged_in?(session)
            if Tag.new(params[:tag]).valid?
                if !Tag.find_by(:name => params[:tag][:name].downcase)
                    tag = Tag.create(params[:tag])
                    tag.name = tag.name.downcase
                    tag.save
                    book = Book.find_by_id(params[:id])
                    if book
                        book.tags << tag
                        redirect to "/books/#{params[:id]}/edit"
                    else 
                        @tags = Tag.all
                        erb :'/tags/index'
                    end
                else
                   "Submission invalid. Please try again!"
                end
            end
            "Submission invalid. Please try again!"
        else
            erb :'users/error'
        end
        
    end

    get '/tags/:id' do
        @books = Book.all
        @tag = Tag.find_by_id(params[:id])
        #definitely want to be able to have slugs as urls here
        erb :'tags/show'
    end

    get '/tags/:id/edit' do #edit
        if Helpers.is_logged_in?(session)
            @tag = Tag.find_by_id(params[:id])
            erb :'tags/edit'
        else
            erb :'users/error'
        end
    end

    patch '/tags/:id' do #update
    if Helpers.is_logged_in?(session)
        tag = Tag.find_by_id(params[:id])
        if tag.user_id == session[:user_id] || session[:user_id] == 1
            if params[:tag][:name] != ""
                tag.update(params[:tag])
            end
        end

        redirect to "tags/#{tag.id}"
    else
        erb :'users/error'
    end
    end

    delete '/tags' do #destroy
        if Helpers.is_logged_in?(session)
            tag = Tag.find_by_id(params[:id])
            if tag.user_id == session[:user_id] || session[:user_id] == 1
            tag.delete
            end

            redirect to "/tags"
        else
            erb :'users/error'
        end
    end

end