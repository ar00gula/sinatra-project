class BookTag < ActiveRecord::Base
    belongs_to :tag
    belongs_to :book
end
