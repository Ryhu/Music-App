class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])

  end

  def new
    @band = Band.new
    render :new

  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    redirect_to bands_url

  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
