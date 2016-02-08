class SearchesController < ApplicationController
	def index
		@search = ThinkingSphinx.search(params[:search])
	end

	def create
		@search = Search.create!(params[:search])
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end
end
