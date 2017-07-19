class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  before_action :set_header

  protected
  def set_header
    @header = Header.find(:id)
  end

end
