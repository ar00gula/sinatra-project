class User < ActiveRecord::Base
    has_many :books
    has_many :tags
    has_secure_password
end