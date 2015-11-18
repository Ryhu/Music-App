class TracksController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      @album = @track.album
      render :new
    end

  end


  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    @album = @track.album
    render :show

  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    redirect_to album_url(@track.album)


  end

  private
  def track_params
    params.require(:track).permit(:track_name, :track_length, :album_id, :track_type, :lyrics)
  end


end
