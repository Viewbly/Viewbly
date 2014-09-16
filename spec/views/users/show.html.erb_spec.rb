require 'rails_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :full_name => "Full Name",
      :email => "Email",
      :password_digest => "Password Digest",
      :username => "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Full Name/)
    rendered.should match(/Email/)
    rendered.should match(/Password Digest/)
    rendered.should match(/Username/)
  end
end
