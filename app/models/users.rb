class User < ActiveRecord::Base
    has_many :books
    has_many :tags
    has_many :reviews
    has_secure_password
end