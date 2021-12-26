class GoalsController < ApplicationController
  before_action :set_goal, only: %i[show edit update destroy]

  def index
    @goals = Goal.all
  end

  def show; end

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
      redirect_to goals_path, notice: 'Goal was successfully updated.'
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
