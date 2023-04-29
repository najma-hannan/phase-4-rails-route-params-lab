class StudentsController < ApplicationController
  def index
    if !params[:name]
      students = Student.all
      render json: students
    else
      name = params[:name].capitalize()
      students =
        Student.all.select do |student|
          student.first_name == name || student.last_name == name
        end
      render json: students
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
