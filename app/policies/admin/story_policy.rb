class Admin::StoryPolicy < ApplicationPolicy
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

  def home?
    true
  end

  def index?
    true
  end

  def show?
    true
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



