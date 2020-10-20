class Project < ApplicationRecord
  validates :name, presence: true, length: {in: 2..20}
  validates :time, presence: true
  belongs_to :user
  belongs_to :group, optional: true

  scope :ungrouped, -> { where(group: nil) }

  default_scope -> { order(created_at: :desc).includes([:group]) }
end
