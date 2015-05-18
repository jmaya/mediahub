class CoursesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:index, :search]

  check_authorization
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    render text: "You are not authorized"
  end 

  # GET /courses
  def index
    @courses = Course.order("updated_at DESC").page(params[:page])
    @tags = Course.tag_counts_on(:tags)
  end

  # GET /courses/1
  def show
    @course_sorter = CourseSorter.new(@course)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      unless params[:file_attachments].nil?
        params[:file_attachments][:file].each do |a|
          # @file_atachment = @course.file_attachments.create(:file => a, :course_id => @course.id)
          prepare_job a,@course
          
        end
      end
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      unless params[:file_attachments].nil?
        params[:file_attachments][:file].each do |a|
          # @file_atachment = @course.file_attachments.create(:file => a, :course_id => @course.id)
          prepare_job a,@course
        end
      end
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  def search
    if params[:tag]
      @courses = Course.tagged_with(params[:tag]).page
    else
      @courses = Course.includes([:file_attachments]).where("name ilike ?", "%#{params[:course][:query]}%").order(created_at: :desc).page(params[:page])
    end
    render :index
  end

  private


  def prepare_job temp_file,course
    temp_folder = File.expand_path(Rails.root.to_s) + "/tmp"
    filename = File.basename(temp_file.tempfile.path)
    full_path = File.join(temp_folder,filename)
    #Save the file to a temp path
    File.open(full_path, 'wb') do |out|
      out.write temp_file.tempfile.read
    end
    data = {}
    data["original_filename"] = temp_file.original_filename
    data["content_type"] = temp_file.content_type
    CourseMoverJob.perform_later(course.id,full_path,data)
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:name, :company, :tag_list)
  end
end
