class ImagePolicy < ApplicationPolicy
  attr_reader :user, :image
  def initialize(user, image)
    @user = user
    @image = image
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



