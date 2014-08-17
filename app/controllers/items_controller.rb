class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy]

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.list_id = params[:list_id]

    if @item.save
      redirect_to @item.list, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    redirect_to @item.list, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:title, :url, :list_id)
    end
end
