class Admin::NewsItemPolicy < ApplicationPolicy
  attr_reader :user, :ni
  def initialize(user, ni)
    @user = user
    @ni = ni
  end 

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.present? && @user.admin?
  end

  def show?
    @user.present? && @user.admin?
  end

  def create?
    @user.present? && @user.admin?
  end

  def update?
    @user.present? && @user.admin?
  end

  def destroy?
    @user.present? && @user.admin?
  end
end
