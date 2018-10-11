class Training < ApplicationRecord
    belongs_to :menu
    belongs_to :user
    has_many :loads
end