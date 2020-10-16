class Project < ApplicationRecord
  validates :name, presence: true
  validates :time,  presence: true
  belongs_to :user
  has_many :groupings
  has_many :groups, through: :groupings

  def group_list
    self.groups.collect {|g| g.name }.join(', ')
  end

  def group_list=(group_string)
    group_names = group_string.split(',').collect {|s| s.strip.downcase}.uniq
    found_groups = group_names.collect {|name| Group.find_or_create_by(name: name)}
    self.groups = found_groups if found_groups
  end
 
end
