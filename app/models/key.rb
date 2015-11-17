class Key < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true
  validates :link, presence: true
  validates :user, presence: true
  validates :password, presence: true
end
