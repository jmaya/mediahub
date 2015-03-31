class FileAttachmentsController < ApplicationController
  before_action :set_course, only: [:destroy]
  before_action :set_file_attachment, only: [:destroy]

  def destroy
    @file_atachment.destroy
    redirect_to edit_course_path(@course), notice: 'File Attachment was successfully destroyed.'
  end


  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_file_attachment
    @file_atachment = FileAttachment.find(params[:id])
  end

end

