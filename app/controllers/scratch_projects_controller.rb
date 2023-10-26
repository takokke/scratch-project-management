class ScratchProjectsController < ApplicationController
  
  def index
    @projects_of_all = []
    students = Student.all
    students.each do |student|
      url ="https://api.scratch.mit.edu/users/#{student.scratch_username}/projects"
      # url = "https://api.scratch.mit.edu/users/t-okazaki"
      uri = URI.parse(url)
      res = Net::HTTP.get(uri)
      res = JSON.parse(res)
      @projects_of_all.push(res)
    end
  end
  
  def show
    
  end
  
  private
end
