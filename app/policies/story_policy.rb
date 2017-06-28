class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story
  def initialize(user, story)
    @user = user
    @story = story
  end 

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

end



