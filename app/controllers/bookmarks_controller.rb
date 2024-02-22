class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy show]
  before_action :set_list, only: %i[create new show]
  def index
    @bookmarks = Bookmark.all
  end

  def show; end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
  end

  def new
    @bookmark = Bookmark.new
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
