class Admin::LessonPolicy < ApplicationPolicy
  attr_reader :user, :lesson
  def initialize(user, lesson)
    @user = user
    @lesson = lesson
  end

  class Scope < Scope
    def resolve
      if @user.present? && @user.is_admin?
        scope.all
      else
        scope.all
        #scope.where(published: true)
      end
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




