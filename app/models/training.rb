class Training < ApplicationRecord
    belongs_to :menu
    has_many :loads
end