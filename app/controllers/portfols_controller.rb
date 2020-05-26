class PortfolsController < ApplicationController
  before_action :set_portfol_item, only: [:edit, :show, :update, :destroy]
  layout "portfol"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all
  def index
    @portfolio_items = Portfol.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfol.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  def angular
    @angular_portfolio_items = Portfol.angular
  end

  def new 
    @portfolio_item = Portfol.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfol.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfols_path, notice: 'Yout portfolio item is now live!' }
      else
        format.html { render :new }        
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfols_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy 
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfols_url, notice: 'Record was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfol).permit(:title, 
                                    :subtitle,
                                    :body,
                                    :main_image,
                                    :thumb_image,
                                    technologies_attributes: [:name]
                                    )
  end

  def set_portfol_item
    @portfolio_item = Portfol.find(params[:id])
  end
end
