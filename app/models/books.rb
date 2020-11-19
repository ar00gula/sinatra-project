class Book < ActiveRecord::Base
    has_many :book_tags
    has_many :tags, through: :book_tags
    belongs_to :user

    # def sort_by_title(books)
    #     books.sort do |book|
    #         if self.title.split(" ")[0].downcase == "a" || self.title.split(" ")[0].downcase == "the"


    #     end 
end
