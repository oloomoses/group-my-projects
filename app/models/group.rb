class Group < ApplicationRecord
  belongs_to :user
  has_many :groupings
  has_many :projects, through: :groupings
  before_save { self.name.downcase! }
end
