class HomeController < ApplicationController
  def index
    @lists = List.unarchived(current_user)
  end
end
