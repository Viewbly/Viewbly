class User < ActiveRecord::Base

	has_secure_password

	has_many :views, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

	validates :email, presence: true,
					  uniqueness: true,
					  format: {
					  	with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.|[A-Za-z]+\z/
					  }

	validates :username, presence: true,
  					  uniqueness: true

	validates :terms_of_service, acceptance: true
  


	before_save :downcase_email

	def feed 
	end

	def following?(other_user)
		relationships.find_by(followed_id: other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
    	relationships.find_by(followed_id: other_user.id).destroy
  	end

	def downcase_email
		self.email = email.downcase
	end

	def generate_password_reset_token!
    update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
  end

  searchable do
    text :full_name, boost: 5.0
    text :username, boost: 4.0
  end

end
