module Api
  module V1
    class FileAttachmentsController < ApplicationController
      # before_action :authenticate_user!, only: [:sort]

      def create
        @file_attachment = FileAttachment.new(file_attachment_params)
        if @file_attachment.save
          render json: @file_attachment
        else
          render json: {
            error: "File Attachment Not created #{@file_attachment.errors.inspect}"
          }.to_json, status: :not_found
        end
      end

      def exists
        @file_attachment = FileAttachment.where(sha_1_hash: params['hash']).first
        if @file_attachment
          render json: @file_attachment
        else
          render json: {
            error: 'File Attachment not found'
          }.to_json, status: :not_found
        end
      end

      def sort
        params[:file_attachment].each_with_index do |file_attachment_id, index|
          file_attachment = FileAttachment.find(file_attachment_id)
          file_attachment.insert_at index
        end
        render json: { status: 'Ok'}
      end

      private

      def file_attachment_params
        params.require(:file_attachment).permit(:course_id, :file)
      end
    end
  end
end
