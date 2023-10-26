class StudentsController < ApplicationController

  def index
    @students = Student.all
  end
  
  def show
    @student = Student.find(params[:id])
    url ="https://api.scratch.mit.edu/users/#{@student.scratch_username}/projects"
    # url = "https://api.scratch.mit.edu/users/t-okazaki"
    uri = URI.parse(url)
    res = Net::HTTP.get(uri)
    res = JSON.parse(res)
    @projects = res
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.save
    redirect_to students_path
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to students_path
  end
  
  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to students_path
  end
  
  private
  
  def student_params
    params.require(:student).permit(:scratch_username, :name)
  end

end
