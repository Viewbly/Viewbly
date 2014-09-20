require 'rails_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :full_name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :username => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_full_name[name=?]", "user[full_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password_digest[name=?]", "user[password_digest]"
      assert_select "input#user_username[name=?]", "user[username]"
    end
  end
end
