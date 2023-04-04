class Story < ApplicationRecord
  belongs_to :user

  # 驗證
  validates :title, presence: true
end
