class CommentsController < ApplicationController

  before_action :find_patient

  def new
    @sub_goal = SubGoal.find(params[:sub_goal_id])
    @comment = @patient.comments.build
  end

  def create
    @comment = @patient.comments.build(comment_params)

    if @comment.save
      redirect_to patient_plan_of_cares_path, notice: 'Comment registered'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def find_patient
    @patient = Patient.find(params[:patient_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:patient_id, :sub_goal_id, :message)
  end
end
