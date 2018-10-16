class Menu < ApplicationRecord
    belongs_to :user
    has_one :training
    has_many :parts
    has_many :types
    has_many :loads
end




