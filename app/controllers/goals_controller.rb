class GoalsController < ApplicationController
  before_action :set_goal, only: %i[edit update destroy]

  def index
    @goals = Goal.alphabetically
    @ltg_goals = @goals.ltg
    @stg_goals = @goals.stg
  end

  def show
    @goal = Goal.includes(sub_goals: :words).find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def edit; end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to goals_path, notice: 'Goal was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_path(@goal), notice: "'#{@goal.title}' updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_path, notice: 'Goal was successfully destroyed.'
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :goal_type, :more_info)
  end
end
