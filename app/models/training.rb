class Training < ApplicationRecord
    belongs_to :post
    has_many :menus, inverse_of: :training
    accepts_nested_attributes_for :menus, reject_if: :all_blank, allow_destroy: true
end