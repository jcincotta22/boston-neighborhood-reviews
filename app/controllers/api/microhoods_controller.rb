class Api::MicrohoodsController < ApiController
  def index
    microhoods = Microhood.all.reverse_order
    render json: { microhoods: microhoods }, status: :ok
  end
end
