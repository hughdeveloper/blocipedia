require 'rails_helper'

RSpec.describe Wiki, type: :model do

  before(:all) do
    @user1 = create(:user)
  end

  let(:wiki) { Wiki.create!(title: "New Post Title", body: "New Wiki Body", private: false, user: @user1) }


  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes(title: "New Post Title", body: "New Wiki Body", private: false, user: @user1)
    end
  end
end
