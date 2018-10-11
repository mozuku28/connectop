class Menu < ApplicationRecord
    belongs_to :user
    has_many :trainings
    has_many :parts
    enum type: { 通常: 0, 回数: 1, 時間: 2, 距離: 3 }
end
