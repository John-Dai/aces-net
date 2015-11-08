class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_person!
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    @people = Person.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
  	@courses =  Course.all
    @course = current_person.courses.new(course_params)
    @courses.each do |c|
    	if c.subject==@course.subject && c.course_number==@course.course_number
    		respond_to do |format|
    			format.html { redirect_to @course, notice: 'Course was successfully created.' }
    			format.json { render :show, status: :created, location: @course }
    			break
    		end
      end
    end
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def addfriend
  	@target = Person.find(params[:id_params])
  	current_person.invite @target
  	respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Friend request sent' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:subject, :course_number, :title)
    end
end
