class PagesController < ApplicationController

	def index
		@recipe = Recipe.all.order("created_at DESC")
		@recipe_day = Recipe.order("RANDOM()").first
		@last_recipe = Recipe.all.order("created_at DESC").limit(6)
		@last_post = Post.all.order("created_at DESC").limit(3)
	end

	def contacts

	end

end