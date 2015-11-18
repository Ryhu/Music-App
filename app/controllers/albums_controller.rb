class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy


  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end

  end

  private
  def album_params
    params.require(:album).permit(:title, :band_id, :album_type, :year, :album_length_time)
  end
end
