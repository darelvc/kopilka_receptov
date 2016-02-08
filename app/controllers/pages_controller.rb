class PagesController < ApplicationController

	def index
		@recipe = Recipe.all.order("created_at DESC")
		@recipe_day = Recipe.order("RANDOM()").first
		@last_recipe = Recipe.all.order("created_at DESC").limit(6)
		@last_post = Post.all.order("created_at DESC").limit(3)
		@recipe_of_the_day = Recipe.recipe_of_the_day

		@recent_comments = Comment.with_state(:published)
                       .where(commentable_state: [:published])
                       .recent.page(params[:page])
    @most_liked = Recipe.order("vote_total DESC").limit(5)
	end

	def contacts

	end

end