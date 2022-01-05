class WordsController < ApplicationController
  before_action :set_word, only: %i[edit update destroy]
  before_action :find_goal
  before_action :find_sub_goal

  def new
    @word = @sub_goal.words.build
  end

  def edit; end

  def create
    @word = @sub_goal.words.build(word_params)

    if @word.save
      redirect_to goal_path(@goal), notice: "Word created: #{@word.name}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @word.update(word_params)
      redirect_to goal_path(@goal), notice: 'Word was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @word.destroy
    redirect_to goal_path(@goal), notice: "'#{@word.name}' deleted"
  end

  private

  def find_goal
    @goal = Goal.find(params[:goal_id])
  end

  def find_sub_goal
    @sub_goal = SubGoal.includes(:words).find(params[:sub_goal_id])
  end

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:name, :sub_goal_id, :word_id)
  end
end
