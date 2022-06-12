class RecipesController < ApplicationController
    def index
        recipes = Recipe.all
        render json: recipes, include: ['user'], status: 201
    end

    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, include: ['user'], status: 201
    end

    private

    def recipe_params
        params.permit(:user_id, :title, :instructions, :minutes_to_complete)
    end
end
