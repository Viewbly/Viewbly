require 'rails_helper'

describe User do
	let(:valid_attributes) {
		{
			full_name: "Cameron Luken",
			email: "camstr10@gmail.com",
			username: "cam",
			password: "password"
			password_confirmation: "password"
		}
	}
	context "validations" do
		let(:user) { User.new(valid_attributes) }
		
		before do
			User.create(valid_attributes)
		end

		it "requires an email" do
			expect(user).to validate_presence_of(:email)
		end

		it "requires a unique email" do
			expect(user).to validate_uniqueness_of(:email)
		end

		it "requires a unique email (case sensitive)" do
			user.email = "CAMSTR10@GMAIL.COM"
			expect(user).to validate_uniqueness_of(:email)
		end

		it "requires the email address to look like an email" do
			user.email = "cam"
			expect(user).to_not be_valid
	end

	describe "#downcase_email" do
		it "makes the email attribute lower case" do
			user = User.new(valid_attributes.merge(email: "CAMSTR10@GMAIL.COM"))
			expect{ user.downcase_email }.to change{ user.email}.
			 from("CASMTR10@GMAIL.com").
			 to("camstr10@gmail.com")
		end

		it "downcases an email before saving" do
			user. = User.new(valid_attributes)
			user.email = "CAMSTR10@GMAIL.com"
			expect(user.save).to be_true
			expect(user.email).to eq("camstr10@gmail.com")
		end
	end
end
