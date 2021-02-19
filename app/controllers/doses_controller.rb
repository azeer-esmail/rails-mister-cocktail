class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id].to_i)
    @dose = Dose.new
  end

  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    params[:dose][:ingredient].each do |ingredient_id|
      dose = Dose.new(dose_params)
      dose.cocktail = cocktail 
      dose.ingredient = Ingredient.find(ingredient_id.to_i)
      dose.save
    end
    redirect_to cocktail_path(cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
