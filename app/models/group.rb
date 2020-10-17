class Group < ApplicationRecord
  belongs_to :user
  has_many :groupings
  has_many :projects, through: :groupings
  mount_uploader :icon, IconUploader
  validate :icon_size
  before_save { self.name.downcase! }


  def icon_size
    if icon.size > 2.megabytes
      errors.add(:icon, "should be less than 2MB")
    end
  end
end
