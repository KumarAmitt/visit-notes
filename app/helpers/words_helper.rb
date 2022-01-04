module WordsHelper

  def calc_score(patient, word)
    trials = patient.pronunciations.find_by(word_id: word.id).trials
    success = trials.count('+')
    total = trials.length
    ["#{success}/#{total}", (success * 100) / total]
  end

  def prompting_level(patient, word)
    level = patient.pronunciations.find_by(word_id: word.id).prompting_level

    case level
    when 'Independent'
      "<div class='independent'>Independent</div>".html_safe
    when 'Intermediate'
      "<div class='intermediate'>Intermediate</div>".html_safe
    else
      "<div class='controlling'>Controlling</div>".html_safe
    end
  end

end
