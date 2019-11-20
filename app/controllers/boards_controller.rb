class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    # コメントを入力できるように定義
    @comment = Comment.new(board_id: @board.id)
    @comments = Comment.where(board_id: @board.id)
  end

  def new
    @board = Board.new
    # binding.pry
  end
  
  def create
    # binding.pry
    @board = Board.new(board_params)
    @board.save
    redirect_to boards_path
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    redirect_to board_path(@board)
  end
  
  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
