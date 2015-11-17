class Project < ActiveRecord::Base
	has_many :keys, dependent: :destroy

	validates :title, presence: true
end
