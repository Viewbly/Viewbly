class View < ActiveRecord::Base
	
	belongs_to :user

	validates :content, presence: true
	validates :content, length: { minimum: 1 }
end
