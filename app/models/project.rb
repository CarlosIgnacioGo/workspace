class Project < ActiveRecord::Base
	has_many :keys

	validates :title, presence: true
end
