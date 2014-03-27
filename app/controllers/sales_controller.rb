class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    sale = Sale.create(params[:sale])
    redirect_to new_item_path
  end

  def show
    @sale = Sale.find params[:id]
  end

  def edit
    @sale = Sale.find params[:id]
  end

  def search
  end

  def result 
    if params[:search].present?  
      g= Geocoder.coordinates(params[:search])
      @sales = Sale.near([g[0], g[1]], 1, :units => :km)
    else  
      @sales = Sale.all  
    end  
  end  

  def update
    sale = Sale.find params[:id]
    sale.update_attributes (params[:sale])
    redirect_to sale
  end

  def destroy
    sale = Sale.find params[:id]
    sale.destroy
    redirect_to sales_path
  end

end