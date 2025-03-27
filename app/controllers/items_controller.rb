class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:index, :create, :show, :update, :destroy]
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = @board.items
    render json: @items
  end

  def create
    @item = @board.items.new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @item
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_board
    @board = current_user.boards.find(params[:board_id])
  end

  def set_item
    @item = @board.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:link, :x, :y, :width, :height)
  end

end
