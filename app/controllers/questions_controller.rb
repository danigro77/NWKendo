class QuestionsController < ApplicationController
  before_action :get_item,   only: [:destroy, :update, :edit, :change_position]
  before_action :authorize_admin

  def manage
    @questions = Question.order(position: :asc)
  end

  def destroy
    if @question.delete
      flash[:notice] = "The question was successfully deleted."
      redirect_to manage_questions_path
    else
      flash[:alert] = "The question could not be deleted."
    end
  end

  def new
    @question = Question.new
    @question.position = Question.all.length + 1
  end

  def create
    params[:question][:position] = Question.all.length + 1
    if Question.create(question_params)
      flash[:notice] = "The question was successfully created"
      redirect_to manage_questions_path
    else
      flash[:alert] = "The question could not be created."
    end
  end

  def edit
    @positions = Question.all.collect {|item| item.position}.sort
  end

  def update
    if @question.update(question_params)
      flash[:notice] = "The question was sucessfully updated"
      redirect_to manage_questions_path
    else
      flash[:alert] = "The question could not be updated."
    end
  end

  def change_position
    direction = params[:direction]
    current_position = @question.position
    next_positions = direction == 'up' ? current_position-1 : current_position+1
    other_question = Question.find_by_position(next_positions)
    if other_question && @question.update({position: next_positions}) && other_question.update({position: current_position})
      redirect_to manage_questions_path
    else
      flash[:alert] = "The question could not be updated."
    end

  end


  private
  def question_params
    params.require(:question).permit(:question, :answer, :position)
  end
  def get_item
    @question = Question.find(params[:id])
  end
end
