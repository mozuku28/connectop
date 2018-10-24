class Post < ApplicationRecord
    has_many :trainings, dependent: :destroy, inverse_of: :post
    accepts_nested_attributes_for :trainings, reject_if: :all_blank, allow_destroy: true
    belongs_to :user

    # リファイルにて画像処理の為の記述
    attachment :image

    # バリデーション処理
    # validates :memo, presence: true

end