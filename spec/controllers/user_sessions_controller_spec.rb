require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end
  end

  describe "POST 'create'" do
    let!(:user) { User.create(full_name: "Cameron", email: "camstr10@gmail.com", password: "Password1234", username: "cam")
}
    context "with correct credentials" do
    it "redirects to the todo list path" do
      post :create, email: "camstr10@gmail.com", password: "Password1234"
      expect(response).to be_redirect
      expect(response).to redirect_to(views_path)
    end

    it "finds the user" do
      expect(User).to receive(:find_by).with({username: "cam"}).and_return(user)
      post :create, email: "camstr10@gmail.com", password: "Password1234"
    end

    it "authenticates the user" do
      User.stub(:find_by).and_return(user)
      expect(user).to receive(:authenticate)
      post :create, email: "camstr10@gmail.com", password: "Password1234"

    it "it sets user_id in the session" do
      post :create, email: "camstr10@gmail.com", password: "Password1234"
      expect(session[:user_id]).to eq(user.id)
  end
end
end

end
