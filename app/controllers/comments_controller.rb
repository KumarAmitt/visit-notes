class CommentsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @comment = @patient.comments.build
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @comment = @patient.comments.build(comment_params)

    if @comment.save
      redirect_to patient_plan_of_cares_path, notice: 'Comment registered'
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:patient_id, :sub_goal_id, :message)
  end
end