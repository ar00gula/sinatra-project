class ApplicationController < Sinatra::Base
    set :views, proc { File.join(root, '../views/')}
    register Sinatra::Twitter::Bootstrap::Assets

    configure do
		set :views, "app/views"
    enable :sessions
    set :session_secret, "eb62d1ad9f7f37109cad1e34c737f945"
    end

    # ADD "before do" method!!! use this to say where users vs non-users can go
    #CREATE VALIDATION METHODS!!!
    #create helper methods for:
      #User.find_by_id etc

    get '/' do
        erb :index
    end
end