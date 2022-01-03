class PlanOfCaresController < ApplicationController
  before_action :find_patient
  before_action :find_patient_goal, only: %i[index new]

  def index
    @patient_ltg_goals = @patient_goals.ltg
    @patient_stg_goals = @patient_goals.stg
  end

  def show
    @goal = Goal.includes(sub_goals: :words).find(params[:id])
  end

  def new
    @poc = @patient.plan_of_cares.build
    @available_goals = Goal.where.not(id: @patient_goals.pluck(:id)).alphabetically
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

  def find_patient_goal
    @patient_goals = @patient.goals.alphabetically
  end

  def plan_of_cares_params
    params.require(:plan_of_care).permit(:patient_id, :goal_id)
  end
end
