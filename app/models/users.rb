class User < ActiveRecord::Base
    has_many :books
    has_many :tags
    has_many :reviews
    has_secure_password
    has_many :star_ratings
    has_many :heart_ratings
end