class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find params[:id]
    @track_courses = @track.track_courses
  end
end
