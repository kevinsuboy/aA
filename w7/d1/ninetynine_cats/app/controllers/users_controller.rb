class UsersController < ApplicationController
  before_action :require_logged_in!, except: [:create,:new]
  # before you can access anything, are you logged in?

  def new
  end

  def create
  end
end
