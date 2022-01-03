class SubGoalsController < ApplicationController
  before_action :set_sub_goal, only: %i[edit update destroy]

  before_action :set_goal

  def new
    @sub_goal = @goal.sub_goals.build
  end

  def edit; end

  def create
    @sub_goal = @goal.sub_goals.build(sub_goal_params)

    if @sub_goal.save
      redirect_to goal_path(@goal), notice: 'Sub goal was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sub_goal.update(sub_goal_params)
      redirect_to goal_path(@goal), notice: 'Sub goal was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sub_goal.destroy
    redirect_to goal_path(@goal), notice: 'Sub goal was successfully destroyed.'
  end

  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_sub_goal
    @sub_goal = @goal.sub_goals.find(params[:id])
  end

  def sub_goal_params
    params.require(:sub_goal).permit(:title, :goal_id)
  end
end
