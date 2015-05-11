class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.unarchived(current_user)
  end

  def archive_index
    @lists = List.archived(current_user)
  end

  def completed_tasks
    @list = List.find(params[:id])
  end

  def archive
    list = List.find(params[:id])
    list.update_attributes(archived: params[:archived])
    redirect_to root_path, alert: "#{list.title} has been archived"
  end

  def create
    list = List.new(title: list_params[:title], user: current_user)
    if list.save
      redirect_to :back
    else
      redirect_to :back, alert: "Oh no, that didn't quite work, try again."
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update_attributes(update_list_params)
    redirect_to list_path(params[:id])
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to :back, notice: "#{list.title} has been Deleted"
  end

  private

  def list_params
    params.permit(:title)
  end

  def update_list_params
    params.require(:list).permit(:id, :title)
  end
end
