class HealthCheckController < ApplicationController
  def index
    @course_count = Course.count
    render json: @course_count
  end
end
