require 'rails_helper'
require 'random_data'


RSpec.describe WikisController, type: :controller do

  before(:all) do
    @user1 = create(:user)
  end

  let(:my_wiki){@user1.wikis.create! title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false}



  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_wiki.id } # /wikis/:id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, params: { id: my_wiki.id }
  # #1
      expect(response).to render_template :edit
    end

  # #2
    it "assigns wiki to be updated to @wiki" do
      get :edit, params: { id: my_wiki.id }

      wiki_instance = assigns(:wiki)

      expect(wiki_instance.id).to eq my_wiki.id
      expect(wiki_instance.title).to eq my_wiki.title
      expect(wiki_instance.body).to eq my_wiki.body
    end
  end

  describe "PUT update" do
  it "updates wiki with expected attributes" do
    new_title = RandomData.random_sentence
    new_body = RandomData.random_paragraph

    put :update, params: { id: my_wiki.id, wiki: {title: new_title, body: new_body } }

    updated_wiki = assigns(:wiki)
    expect(updated_wiki.id).to eq my_wiki.id
    expect(updated_wiki.title).to eq new_title
    expect(updated_wiki.body).to eq new_body
  end

  it "redirects to the updated wiki" do
    new_title = RandomData.random_sentence
    new_body = RandomData.random_paragraph

    put :update, params: { id: my_wiki.id, wiki: {title: new_title, body: new_body } }
    expect(response).to redirect_to my_wiki
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

    describe "DELETE destroy" do
      it "deletes the wiki" do
        delete :destroy, params: { id: my_wiki.id }
        count = Wiki.where({id: my_wiki.id}).size
        expect(count).to eq 0
      end

      it "redirects to wikis index" do
        delete :destroy, params: { id: my_wiki.id }
        expect(response).to redirect_to wikis_path
      end
    end
  end
