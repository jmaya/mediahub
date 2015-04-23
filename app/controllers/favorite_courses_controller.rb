class FavoriteCoursesController < ApplicationController
  before_action :set_course

  def create
    if Favorite.create(favorited: @course, user:current_user)
      redirect_to @course, notice: 'Course has been favorited'
    else
      redirect_to @course, alert: 'Something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @course.id, user_id: current_user.id).first.destroy 
    redirect_to @course, notice: 'Course is no longer in favorites' 
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end
end
