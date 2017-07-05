class GenrePolicy < ApplicationPolicy
  attr_reader :user, :genre
  def initialize(user, genre)
    @user = user
    @genre = genre
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



