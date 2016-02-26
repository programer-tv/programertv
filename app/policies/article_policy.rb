class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true if user.admin? || article.active?
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

  def article
    record
  end
end
