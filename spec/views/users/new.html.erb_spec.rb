require 'rails_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :full_name => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :username => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_full_name[name=?]", "user[full_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_password_digest[name=?]", "user[password_digest]"
      assert_select "input#user_username[name=?]", "user[username]"
    end
  end
end
