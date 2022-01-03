class PlanOfCaresController < ApplicationController
  before_action :find_patient

  def index
    # @patient_goals = @patient.goals.includes(sub_goals: :words)
    @patient_goals = @patient.goals.alphabetically
    @patient_ltg_goals = @patient_goals.ltg
    @patient_stg_goals = @patient_goals.stg
  end

  def show
    @goal = Goal.includes(sub_goals: :words).find(params[:id])
  end

  def new
    @poc = @patient.plan_of_cares.build

    @assigned_goals = @patient.goals
    @available_goals = Goal.where.not(id: @assigned_goals.pluck(:id))
  end

  def create
    @poc = @patient.plan_of_cares.build(plan_of_cares_params)

    if @poc.save
      redirect_to patient_plan_of_cares_path(@patient), notice: 'New plan added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_patient
    @patient = Patient.find(params[:patient_id])
  end

  def plan_of_cares_params
    params.require(:plan_of_care).permit(:patient_id, :goal_id)
  end
end
