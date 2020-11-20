class HeartRating < ActiveRecord::Base
    belongs_to :book
    belongs_to :user

    def hearts
        if self.rating == 1
            "♥♡♡♡♡"
        elsif self.rating == 2
            "♥♥♡♡♡"
        elsif self.rating == 3
            "♥♥♥♡♡"
        elsif self.rating == 4
            "♥♥♥♥♡"
        elsif self.rating == 5
            "♥♥♥♥♥"
        end
    end
end