class PlanOfCaresController < ApplicationController
  def index
    @patient = Patient.find(params[:patient_id])
    @patient_goals = @patient.goals
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @poc = @patient.plan_of_cares.build

    @assigned_goals = @patient.goals
    @remaining_goals = Goal.where.not(id: @assigned_goals.pluck(:id))
    @goals = Goal.all
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @poc = @patient.plan_of_cares.build(plan_of_cares_params)

    if @poc.save
      redirect_to patient_plan_of_cares_path(@patient), notice: 'New plan added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def plan_of_cares_params
    params.require(:plan_of_care).permit(:patient_id, :goal_id)
  end

end
