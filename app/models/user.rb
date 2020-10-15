class User < ApplicationRecord
  validates :name, presence: true, length: { in: 2..20 }, uniqueness: true
  validates :username, presence: true, length: { in: 2..20 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_many :projects
  has_many :groups
  
end
