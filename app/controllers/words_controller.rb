class WordsController < ApplicationController
  before_action :set_word, only: %i[show edit update destroy]
  before_action :find_sub_goal

  def new
    @word = @sub_goal.words.build
    @words = Word.all
  end

  def edit; end

  def create
    @word = @sub_goal.words.build(word_params)

    if @word.save
      redirect_to goals_path, notice: 'Word  created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @word.update(word_params)
      redirect_to goals_path, notice: 'Word was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @word.destroy
    redirect_to goals_path, notice: 'Word was successfully destroyed.'
  end

  private

  def find_sub_goal
    @goal = Goal.find(params[:goal_id])
    @sub_goal = SubGoal.find(params[:sub_goal_id])
  end

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:name, :sub_goal_id, :word_id)
  end
end
