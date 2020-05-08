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

end
