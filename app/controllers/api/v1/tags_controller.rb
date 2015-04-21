module Api
  module V1
    class TagsController < ApplicationController
      respond_to :json

      def index
        @tags = ActsAsTaggableOn::Tag.all
      end
    end
  end
end
