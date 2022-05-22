class Apps::FavoritesController < Apps::ApplicationController
  def index
    @articles = current_user.favorites
  end
end
