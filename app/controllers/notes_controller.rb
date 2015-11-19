class NotesController < ApplicationController
  def create
    @note = Note.new(body: params[:track][:note], track_id: params[:track_id], user_id: current_user.id)
    @track = @note.track
    if @note.save
      redirect_to track_url(@track)
    else
      redirect_to track_url(@track)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    @note.destroy

    redirect_to track_url(@track)
  end
end
