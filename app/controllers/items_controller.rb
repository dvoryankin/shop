class ItemsController < ApplicationController
  def hello
    @variable = "#{params[:first_name]}"

    @items_count = Item.count
    render html: "ItemsController #{params[:first_name]} #{params[:family_name]} ! #{@variable } #{@items_count} #{params}"
  end

  def index
  end

  def show
  end
  
  def new
    @item = Item.new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end
