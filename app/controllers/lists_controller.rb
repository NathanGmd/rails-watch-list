class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @list = List.new
  end

  def edit; end

  def show
    @movies = Movie.all
    @bookmarks = Bookmark.where(list: @list)
  end

  def update; end

  def destroy
    @list.destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
