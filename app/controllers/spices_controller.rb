class SpicesController < ApplicationController
  wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    spices = Spice.all
    render json: spices
  end

  # # GET /spices/:id
  # def show
  #   spice = find_spice
  #   render json: spice
  # end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice, status: :accepted
  end

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_not_found_response
    render json: { error: "Spice not found" }, status: :not_found
  end

  def find_spice
    Spice.find(params[:id])
  end
end
