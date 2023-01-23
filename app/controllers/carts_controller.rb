class CartsController < ApplicationController
  rescue_from ActiveRecord::RecondNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[ show edit update destroy ]

  def index
    @carts = Cart.all
  end

  def show; end
  def edit; end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy 
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to carts_url }
    end
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_path
  end
end
