class StoryPolicy < ApplicationPolicy
  attr_reader :user, :story
  def initialize(user, story)
    @user = user
    @story = story
  end

  class Scope < Scope
    def resolve
      if @user.present? && @user.is_admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def create?
    true
  end

  def home?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

end



