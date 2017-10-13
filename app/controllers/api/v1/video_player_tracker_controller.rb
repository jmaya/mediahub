module Api
  module V1
    class VideoPlayerTrackerController < ApplicationController
      # before_action :authenticate_user!, except: [:create]
      # check_authorization
      #
      def index
        @video_player_trackers = VideoPlayerTracker.all
      end
      # POST /courses
      # def create
      #   begin
      #     @course = Course.find_or_create_by(name:course_params[:name])
      #   rescue │ActiveRecord::RecordNotUnique
      #     @course = Course.find_by(name: course_params[:name])
      #   end
      #   render json: @course
      # end

      # private
      # Only allow a trusted parameter "white list" through.
      # def course_params
      #   params.require(:course).permit(:name, :company, :tag_list)
      # end
    end
  end
end

