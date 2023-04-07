# frozen_string_literal: true

class Story < ApplicationRecord
  include AASM

  belongs_to :user

  # 查詢
  default_scope { where(deleted_at: nil) }

  # 驗證
  validates :title, presence: true

  # 狀態機
  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :publish
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end
end
