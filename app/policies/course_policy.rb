class CoursePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true if user.admin? || course.active?
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

  def course
    record
  end
end
