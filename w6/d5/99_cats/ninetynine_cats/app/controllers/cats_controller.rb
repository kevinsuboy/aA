class CatsController < ApplicationController
  # def index
  #   render json: Cat.all
  # end

  def index
    @kittens = Cat.all
    render :index #"index=> index.html.erb"
  end


  def show
    @kitty = Cat.find(params[:id])
    render :show
    # render json: kitty
  end

  def new
    @kitty = Cat.new
    render :new
  end
  # def edit
  # end

  def create
    @kitty = Cat.new(cats_params)
    if @kitty.save
      # render json: kitty
      redirect_to cat_url(@kitty)
    else
      # render json: kitty.errors.full_messages, status: 402
      render :new
    end
  end
  def update
    kitten = Cat.find(params[:id])
    if kitten.update(cats_params)
      render json: kitten
    else
      render json: kitten.errors.full_messages, status: 402
    end
  end
  def destroy
    kitty = Cat.find(params[:id])
    kitty.destroy
    render json: kitty
  end



  private
  def cats_params
    params.require(:cat).permit(:description, :birth_date, :name, :color, :gender)
  end
end
