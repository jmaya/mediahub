module Api
  module V1
    class FileAttachmentsController < ApplicationController
      def create
        @file_attachment = FileAttachment.new(file_attachment_params)
        if @file_attachment.save
          render json: @file_attachment
        else
          render json: {
            error: 'File Attachment Not created'
          }.to_json,
          status: :not_found
        end
      end

      def exists
        @file_attachment = FileAttachment
          .where(sha_1_hash: params['hash']).first
        if @file_attachment
          render json: @file_attachment
        else
          render json: {
            error: 'File Attachment not found'
          }.to_json,
          status: :not_found
        end
      end

      private

      def file_attachment_params
        params.require(:file_attachment).permit(:course_id, :file)
      end

    end
  end
end
