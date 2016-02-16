class UserPolicy < ApplicationPolicy
  def index?
    true if user.admin?
  end

  def show?
    true if user.admin? || user == record
  end
end
