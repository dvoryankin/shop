class ItemsController < ApplicationController
  def hello
    @variable = "#{params[:first_name]}"

    @items_count = Item.count
    render html: "ItemsController #{params[:first_name]} #{params[:family_name]} ! #{@variable } #{@items_count} #{params}"
  end

  def index
    @items = Item

    # Only active
    @items = @items.where(active: true)
    
    # Set order
    order = params[:order] == "asc" ? "asc" : "desc"
    @items = @items.order("created_at #{order}")

    @items = Item.paginate(per_page: 5, page: params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to @item
    else
      render "new"
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to @item
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    allow = [:name, :description, :price, :weight]
    params.require(:item).permit(allow)
  end
end
