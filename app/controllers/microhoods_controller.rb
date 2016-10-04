
class MicrohoodsController < ApplicationController
  def index
    @microhoods = Microhood.all
  end

  def new
    @microhood = Microhood.new
    neighborhoods = Neighborhood.all
    @neighborhoods_collection = []

    neighborhoods.each do |neighborhood|
      @neighborhoods_collection << [neighborhood.name, neighborhood.id]
    end
  end

  def create
    @user = current_user
    @microhood = Microhood.new(microhood_params)
    @microhood.user = @user

    if @user
      if @microhood.save
        flash[:notice] = "Successfully Created New Microhood"
        redirect_to microhood_path(@microhood)
      else
        @errors = @microhood.errors.full_messages.join(', ')
        flash[:notice] = @errors
        render 'new'
      end
    else
      flash[:notice] = "You must be signed in"
      redirect_to new_microhood_path
    end
  end

  def edit
    @microhood = Microhood.find(params[:id])
    neighborhoods = Neighborhood.all
    @neighborhoods_collection = []

    neighborhoods.each do |neighborhood|
      @neighborhoods_collection << [neighborhood.name, neighborhood.id]
    end
  end

  def update
    @microhood = Microhood.find(params[:id])
    if@microhood.update_attributes(microhood_params)
      redirect_to @microhood
    else
      render 'edit'
    end
  end

  def destroy
    Microhood.destroy(params[:id])
    redirect_to microhoods_path
  end

  def show
    @microhood = Microhood.find(params[:id])
    @reviews = @microhood.reviews
    @current_user = current_user
  end

  private

  def microhood_params
    params.require(:microhood).permit(:neighborhood_id, :name, :street, :zip, :description)
  end

end
