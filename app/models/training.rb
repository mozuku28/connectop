class Training < ApplicationRecord
    belongs_to :post
    has_many :menus
    has_many :loads, dependent: :delete_all, inverse_of: :training
    accepts_nested_attributes_for :loads, reject_if: :all_blank, allow_destroy: true
end