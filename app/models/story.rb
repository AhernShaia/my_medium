class Story < ApplicationRecord
  belongs_to :user

  default_scope { where( deleted_at: nil)}
  # 驗證
  validates :title, presence: true
end
