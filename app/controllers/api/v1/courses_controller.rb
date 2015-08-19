module Api
  module V1
    class CoursesController < ApplicationController
      # POST /courses
      def create
        @course = Course.new(course_params)
        if @course.save
          render json: @course
        else
          render json: {
            error: 'Course Not created'
          }.to_json, status: :not_found
        end
      end

      private
      # Only allow a trusted parameter "white list" through.
      def course_params
        params.require(:course).permit(:name, :company, :tag_list)
      end
    end
  end
end

