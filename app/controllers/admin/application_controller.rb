class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!
  layout 'admin'
end
