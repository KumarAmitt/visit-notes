class PronunciationsController < ApplicationController
  before_action :find_patient

  def new
    @word = Word.find(params[:word_id])
    @pronunciation = @patient.pronunciations.build
  end

  def create
    @pronunciation = @patient.pronunciations.build(pronunciation_params)

    if @pronunciation.save
      redirect_to patient_plan_of_care_path(@patient, @pronunciation.word.sub_goal.goal), notice: 'Trial done successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_patient
    @patient = Patient.find(params[:patient_id])
  end

  def pronunciation_params
    params.require(:pronunciation).permit(:patient_id, :word_id, :trials, :prompting_level)
  end
end
