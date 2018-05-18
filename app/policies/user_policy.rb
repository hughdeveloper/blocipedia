class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def free?
    user.free?
  end

  def premium?
    user.premium?
  end
end
