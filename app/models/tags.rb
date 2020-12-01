class Tag < ActiveRecord::Base
    has_many :book_tags
    has_many :books, through: :book_tags
    belongs_to :user

    validates :name, presence: true

end
