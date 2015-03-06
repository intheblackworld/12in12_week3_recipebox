class RecipesController < ApplicationController
  before_action :find_recipe, :only => [:show, :edit, :update, :destroy]


  def index
    @recipe = Recipe.all.order("created_at DESC")
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit

  end

  def create
   @recipe = Recipe.new(recipe_params)
   
    if @recipe.save
      redirect_to @recipe, notice: "你沒有權限加入"
    else
      render 'new'
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to toot_path, notice: "成功刪除"
  end




  private 
    def recipe_params
      params.require(:recipe).permit(:title, :description)
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end



end
