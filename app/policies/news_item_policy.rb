class NewsItemPolicy < ApplicationPolicy
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
