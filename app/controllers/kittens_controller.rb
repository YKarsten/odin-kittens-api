class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kitten_url(@kitten), notice: 'Kitten was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to kitten_url(@kitten), notice: 'Kitten was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
