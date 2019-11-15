class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new(params[:id])
  end

  def create
    if @board.save
      rediredct_to boards_path
    end
  end

  def destroy
  end
  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
