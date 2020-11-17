class Book < ActiveRecord::Base
    has_many :book_tags
    has_many :tags, through: :book_tags
    belongs_to :user
end
