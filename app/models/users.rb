class User < ActiveRecord::Base
    has_many :books
    has_many :tags
    has_many :reviews
    has_secure_password
end

def try_again(input)
    if input == "login"
        "Incorrect username or password. Please try again!"

    elsif input == "signup"
        "Username is already in use. Please try another option!"

    elsif input == "tag"
        "Tag already exists. Please try again!"

    end
end