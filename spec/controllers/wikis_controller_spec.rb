require 'rails_helper'
require 'random_data'


RSpec.describe WikisController, type: :controller do

  before(:all) do
    @user1 = create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      wiki = @user1.wikis.create! title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false
      get :show, params: { id: wiki.id } # /wikis/:id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      wiki = @user1.wikis.create! title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false
      get :edit, params: { id: wiki.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @wikis" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    describe "Wiki create" do

      it "increases the number of Wiki by 1" do
        expect{ post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: @user1 } } }.to change(Wiki,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: @user1 } }
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new wiki" do
        post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false, user: @user1 } }
        expect(response).to redirect_to Wiki.last
      end
    end

end
