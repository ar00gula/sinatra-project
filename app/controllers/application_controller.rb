class ApplicationController < Sinatra::Base
    set :views, proc { File.join(root, '../views/')}
    register Sinatra::Twitter::Bootstrap::Assets

    configure do
		set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
    end

    get '/' do
        erb :index
    end
end