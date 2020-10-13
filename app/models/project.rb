class Project < ApplicationRecord
  validates :name, presence: true
  validates :time,  presence: true
  belongs_to :user
end
