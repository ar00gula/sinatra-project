class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :book

    def book_title
        Book.find_by_id(self.book_id).title
    end

    def book
        Book.find_by_id(self.book_id)
    end

    def user
        User.find_by_id(self.user_id)
    end

end