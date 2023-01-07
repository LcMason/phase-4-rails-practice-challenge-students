class StudentsController < ApplicationController

    #GET /students
    def index
        render json: Student.all
    end
    
    
    #POST /students
    def create
        student = Student.create!(params_student)
        render json: student.instructor, status: :created 

    end

    #PATCH /students/:id
    def update
        @student.update!(params_student)
        render json: @student.instructor, status: :accpeted
    end

    #DELETE /students/:id
    def destroy
        @student.destroy
        head :no_content
    end


    private
    
    def params_student
       params.permit (:name, :age, :major, :instructor_id)
    end

    def find_student
        @student = Student.find(params[:id])
    end

end
