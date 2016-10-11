
class MicrohoodsController < ApplicationController
  def index
    search = Microhood.search(params[:search])
    @search = search == Microhood.all
    @microhoods = search.reverse_order
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
        neighborhoods = Neighborhood.all
        @neighborhoods_collection = []

        neighborhoods.each do |neighborhood|
          @neighborhoods_collection << [neighborhood.name, neighborhood.id]
        end
        @errors = @microhood.errors.full_messages.join(', ')
        flash[:notice] = @errors
        render action: 'new'
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
    neighborhoods = Neighborhood.all
    @neighborhoods_collection = []

    neighborhoods.each do |neighborhood|
      @neighborhoods_collection << [neighborhood.name, neighborhood.id]
    end

    if @microhood.update_attributes(microhood_params)
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
    @review = Review.new
  end

  private

  def microhood_params
    params.require(:microhood).permit(:neighborhood_id, :name, :street, :zip, :description)
  end

end
