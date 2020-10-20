class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 1..20 }, uniqueness: true
  belongs_to :user
  validates :icon, presence: true
  has_many :projects, dependent: :destroy
  mount_uploader :icon, IconUploader
  validate :icon_size
  before_save { name.downcase! }
  default_scope -> { order(created_at: :desc) }

  def icon_size
    errors.add(:icon, 'should be less than 2MB') if icon.size > 2.megabytes
  end
end
