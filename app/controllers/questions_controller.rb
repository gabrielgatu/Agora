class QuestionsController < ApplicationController
	before_action :find_question, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@questions = Question.all
	end

	def show
		@answers = Answer.where(question_id: @question)
	end

	def new
		@question = current_user.questions.build
	end

	def create
		@question = current_user.questions.build(question_params)

		if @question.save
			redirect_to root_path
		else
			render "new"
		end
	end

	def edit
	end

	def update 
		if @question.update(question_params)
			redirect_to @question
		else
			render "edit"
		end
	end

	def destroy
		@question.delete
		redirect_to root_path
	end 

	private 

	def question_params
		params.require(:question).permit(:title, :content)
	end

	def find_question
		@question = Question.find(params[:id])
	end

end