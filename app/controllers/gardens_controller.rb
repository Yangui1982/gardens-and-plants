class GardensController < ApplicationController
  before_action :set_garden, only: %i[ show edit update destroy ]

  def index
    @gardens = Garden.all
  end

  def show
    @plant = Plant.new
  end

  def new
    @garden = Garden.new
  end

  def edit
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def update
    if @garden.update(garden_params)
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :banner_url)
  end
end
