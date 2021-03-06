class PagesController < ApplicationController

	def index
		@recipe = Recipe.all.order("created_at DESC")
		@recipe_day = Recipe.order("RANDOM()").first
		@last_recipe = Recipe.all.order("created_at DESC").limit(6)
		@last_post = Post.all.order("created_at DESC").limit(3)
		@recipe_of_the_day = Recipe.recipe_of_the_day
		@author = User.find_by_id(1)
    @most_liked = Recipe.order("cached_votes_up DESC").limit(5)

    ### SEO ###
    prepare_meta_tags title: "Кулинраные рецепты", description: "Все самые лучшие рецепты собранные в одном месте"
	end

	def contacts

	end

end