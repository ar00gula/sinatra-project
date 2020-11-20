class Book < ActiveRecord::Base
    has_many :book_tags
    has_many :tags, through: :book_tags
    belongs_to :user
    has_many :reviews
    has_many :star_ratings
    has_many :heart_ratings

    # def sort_by_title(books)
    #     books.sort do |book|
    #         if self.title.split(" ")[0].downcase == "a" || self.title.split(" ")[0].downcase == "the"


    #     end 
end
