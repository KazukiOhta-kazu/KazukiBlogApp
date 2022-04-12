class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    @articles = current_user.articles
  end

  def edit
  end
end