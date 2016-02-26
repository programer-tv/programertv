class VideoPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true if user.admin? || video.active?
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

  private

  def video
    record
  end
end
