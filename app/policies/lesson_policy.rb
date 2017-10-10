class LessonPolicy < ApplicationPolicy
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
    true
  end

  def show?
    true
  end

end
