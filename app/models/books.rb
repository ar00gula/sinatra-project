class Book < ActiveRecord::Base
    has_many :book_tags
    has_many :tags, through: :book_tags
    belongs_to :user
    has_many :reviews

    validates :title, presence: true
    validates :author, presence: true
    validates :summary, presence: true
    validates :img_url, presence: true

    def recent_reviews
        Review.where(:book_id => self.id).reverse
    end

    def average_stars
        star_ratings = Review.where(:book_id => self.id).map {|review| review.stars}
        if star_ratings.length > 0
            raw_rating = star_ratings.sum/star_ratings.length
            rating = raw_rating.to_i
            if rating == 1
                "★☆☆☆☆"
            elsif rating == 2
                "★★☆☆☆"
            elsif rating == 3
                "★★★☆☆"
            elsif rating == 4
                "★★★★☆"
            elsif rating == 5
                "★★★★★"
            end
        end
    end

end
