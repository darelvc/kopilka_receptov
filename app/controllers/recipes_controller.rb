class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@recipe = Recipe.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
	end

	def show
		@comments = @recipe.comments.with_state([:draft, :published])
		#@category = Category.find(params[:id])
		@random_recipe = Recipe.where.not(id: @recipe).order("RANDOM()").first
	end

	def new
		@recipe = Recipe.new
	end

	def create
		#@recipe = Recipe.new(recipe_params)
		#@chef = Chef.find(1)

		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save
			redirect_to @recipe, notice: "Новый рецепт создан успешно."
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe), notice: "Ваш рецепт обновлен успешно!"
		else
			render 'edit'
		end
	end

	def destroy
		@recipe.destroy
		redirect_to root_path
	end

	def upvote
		@recipe.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@recipe.downvote_by current_user
		redirect_to :back
	end

	def eat_eyes
		@eat_eyes = Recipe.order("RANDOM()")
	end

	private

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :summary, :description, :difficulty, :pre_time, :cook_time, :servers, :recipe_image, :user_id, ingredients_attributes: [:id, :name, :quantity, :_destroy], category_ids: [])
	end

end