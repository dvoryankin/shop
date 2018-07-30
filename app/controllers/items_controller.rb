class ItemsController < ApplicationController
  def hello
    @variable = "#{params[:first_name]}"

    @items_count = Item.count
    # render html: "It is ItemsController #{params[:first_name]} #{params[:family_name]} ! #{@variable } #{@items_count} #{params}"

  end
end
