require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user1 = create(:user)
  end

  it "user creation is valid with valid arttributes" do
    expect(@user1).to be_valid
  end

  it "has a unique email" do
    user2 = build(:user, username: "Bloc2")
    expect(user2).to_not be_valid
  end

  it "has a unique username" do
    user2 = build(:user, email: "bloc2@blocipedia.com")
    expect(user2).to_not be_valid
  end

  it "is not valid without a password" do
    user2 = build(:user, password: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without an email" do
    user2 = build(:user, email: nil)
    expect(user2).to_not be_valid
  end

  it "is not valid without an username" do
    user2 = build(:user, username: nil)
    expect(user2).to_not be_valid
  end

end
