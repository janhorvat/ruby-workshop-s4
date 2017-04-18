class CatsController < ApplicationController
  def create
    cat = Cat.new(cat_params)
    if cat.save
      render json: cat
    else
      render json: cat.errors.full_messages
    end
  end

  def random
    cat = Cat.order("RANDOM()").last
    render json: cat || { error: "No cats in database" }
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :picture)
  end
end
