class HistoryPolicy < ApplicationPolicy
  attr_reader :user, :history
  def initialize(user, history)
    @user = user
    @history = history
  end 

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

end



