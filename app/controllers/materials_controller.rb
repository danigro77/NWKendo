class MaterialsController < ApplicationController
  def faq
    @questions = Question.all
  end

  def videos
    date = params[:new_date] ? Date.parse(params[:new_date]) : Date.current.beginning_of_month
    @current_month_id = (date.month.to_i)%12 - 1
    all_videos = Video.all.group_by { |m| m.taken_on.beginning_of_month }
    @videos = all_videos[date]
    @month_nav = all_videos.keys.sort
    @current_date_index = @month_nav.index(date)
  end
end