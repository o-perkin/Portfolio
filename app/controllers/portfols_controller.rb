class PortfolsController < ApplicationController
  def index
    @portfolio_items = Portfol.all
  end

  def new 
    @portfolio_item = Portfol.new
  end

  def create
    @portfolio_item = Portfol.new(params.require(:portfol).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfols_path, notice: 'Yout portfolio item is now live!' }
      else
        format.html { render :new }        
      end
    end
  end

  def edit
    @portfolio_item = Portfol.find(params[:id])
  end

  def update
    @portfolio_item = Portfol.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfol).permit(:title, :subtitle, :body))
        format.html { redirect_to portfols_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfol.find(params[:id])
  end

end
