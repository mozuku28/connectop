class Post < ApplicationRecord
    has_many :trainings
    belongs_to :user
    attachment :image
end
