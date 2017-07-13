class Admin::GenrePolicy < ApplicationPolicy
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



