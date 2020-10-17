class Group < ApplicationRecord
  validates :name, presence: true, length: {in: 1..20}, uniqueness: true
  belongs_to :user
  has_many :groupings
  has_many :projects, through: :groupings
  mount_uploader :icon, IconUploader
  validate :icon_size
  before_save { self.name.downcase! }
  default_scope -> { order(created_at: :desc)}


  def icon_size
    if icon.size > 2.megabytes
      errors.add(:icon, "should be less than 2MB")
    end
  end
end
