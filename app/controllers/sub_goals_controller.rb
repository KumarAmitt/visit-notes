class SubGoalsController < ApplicationController
  before_action :set_sub_goal, only: %i[show edit update destroy]

  before_action :find_goal

  def index
    @sub_goals = @goal.sub_goals
  end

  def show; end

  def new
    # @sub_goal = SubGoal.new(@goal.id)
    @sub_goal = @goal.sub_goals.build
  end

  def edit; end

  def create
    # @sub_goal = SubGoal.new(sub_goal_params)
    @sub_goal = @goal.sub_goals.build(sub_goal_params)

    if @sub_goal.save
      redirect_to goal_sub_goal_path(@goal, @sub_goal), notice: 'Sub goal was successfully created.'

    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sub_goal.update(sub_goal_params)
      redirect_to goal_sub_goal_path(@goal), notice: 'Sub goal was successfully updated.'

    else
      render :edit, status: :unprocessable_entity

    end
  end

  def destroy
    @sub_goal.destroy

    redirect_to goal_sub_goals_path(@goal), notice: 'Sub goal was successfully destroyed.'
  end

  private

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_sub_goal
    @sub_goal = SubGoal.find(params[:id])
  end

  def sub_goal_params
    params.require(:sub_goal).permit(:title, :goal_id)
  end
end
