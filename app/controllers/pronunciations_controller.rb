class PronunciationsController < ApplicationController
  def new
    @patient = Patient.find(params[:patient_id])
    @pronunciation = @patient.pronunciations.build
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @pronunciation = @patient.pronunciations.build(pronunciation_params)

    if @pronunciation.save
      redirect_to patient_plan_of_cares_path, notice: 'Comment registered'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pronunciation_params
    params.require(:pronunciation).permit(:patient_id, :word_id, :trials, :prompting_level)
  end
end
