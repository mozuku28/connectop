class Load < ApplicationRecord
    belongs_to :training
    
    # validates :load, presence: true
end
