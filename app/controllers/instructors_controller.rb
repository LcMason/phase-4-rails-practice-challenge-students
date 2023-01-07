class InstructorsController < ApplicationController

    
    #GET /instructors
    def index
        render json: Instructor.all
    end
    
    
    #POST /instructors
    def create
        instructor = Instructor.create!(params_instructor)
        render json: instructor, status: :created
    end

    #PATCH /instructors/:id
    def update
        @instructor.update!(params_instructor)
        render json: @instructor, status: :accepted
    end

    #DELETE /instructors/:id
    def destroy
        @instructor.destroy
        head :no_content
    end

    private

    def params_instructor
        params.permit(:name)
    end

    def find_instructor
        @instructor.find(params[:id])
    end

end
