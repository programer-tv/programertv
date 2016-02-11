class EpisodePolicy < ApplicationPolicy
  def show
    true
  end

  def create?
    true if user.admin?
  end

  def update?
    true if user.admin?
  end

  def destroy?
    true if user.admin?
  end
end
