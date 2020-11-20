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

    def show_stars
        if self.stars == 1
            "★☆☆☆☆"
        elsif self.stars == 2
            "★★☆☆☆"
        elsif self.stars == 3
            "★★★☆☆"
        elsif self.stars == 4
            "★★★★☆"
        elsif self.stars == 5
            "★★★★★"
        end

    end

    def show_hearts
        if self.hearts == 1
            "♥♡♡♡♡"
        elsif self.hearts == 2
            "♥♥♡♡♡"
        elsif self.hearts == 3
            "♥♥♥♡♡"
        elsif self.hearts == 4
            "♥♥♥♥♡"
        elsif self.hearts == 5
            "♥♥♥♥♥"
        end
    end


end