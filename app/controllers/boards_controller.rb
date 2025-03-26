class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:show, :update, :destroy]

  def index
    @boards = current_user.boards
    render json: @boards
  end

  def create
    @board = current_user.boards.new(board_params)
    if @board.save
      render json: @board, status: :created
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @board
  end

  def update
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def set_board
    @board = current_user.boards.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end
end
