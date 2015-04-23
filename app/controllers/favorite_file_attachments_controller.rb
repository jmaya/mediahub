class FavoriteFileAttachmentsController < ApplicationController
  before_action :set_file_atachment

  def create
    if Favorite.create(favorited: @file_atachment, user:current_user)
      redirect_to course_path(@file_atachment.course), notice: 'File Atachment has been favorited'
    else
      redirect_to course_path(@file_atachment.course), alert: 'Something went wrong...'
    end
  end

  def destroy
    Favorite.where(favorited_id: @file_atachment.id, user_id: current_user.id).first.destroy 
    redirect_to course_path(@file_atachment.course), notice: 'File Atachment is no longer in favorites' 
  end

  private
  def set_file_atachment
    @file_atachment = FileAttachment.find(params[:file_attachment_id])
  end
end
