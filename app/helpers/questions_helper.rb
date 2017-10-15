module QuestionsHelper

  def get_path(question)
    case question.link_to_page
      when 0 then root_path
      else
        root_path
    end
  end

  def generate_link_dropdown
    Question.link_to_pages.keys.to_a.collect {|p| [I18n.t("question.link.#{p}"), p ] }
  end
end