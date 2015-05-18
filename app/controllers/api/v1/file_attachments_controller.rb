module Api
  module V1
    class FileAttachmentsController < ApplicationController
      def exists
        @file_attachment = FileAttachment.where(sha_1_hash: params['hash']).first
        if @file_attachment
          render json: @file_attachment
        else
          render :json => {:error => "File Attachment not found"}.to_json, :status => :not_found
        end
      end
    end
  end
end
