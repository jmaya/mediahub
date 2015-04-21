class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def destroy
    @tag = ActsAsTaggableOn::Tag.find params[:id]
    if @tag.destroy
      flash[:notice] = "Tag successfully removed"
      redirect_to tags_path
    else
      flash[:error] = "Issue removing Tag"
      redirect_to tags_path
    end
  end

end
