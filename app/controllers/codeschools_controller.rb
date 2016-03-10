class CodeschoolsController < ApplicationController

  def index
    render json: {
      meta:{
        count: Codeschool.count,
        page: 0
      },
      codeschools: Codeschool.order(:name)
    }

  end


  def show
    codeschool = Codeschool.find(params[:id])
    render json: { codeschool: codeschool }
  end

  def create
    if codeschool = Codeschool.create(codeschool_params)
      render json: { codeschool: codeschool }
    else
      render json: {
        message: "Could no create a new codeschool",
        errors: codeschool.errors,
      }, status: :unprocessible_entity
    end
  end

  private

  def codeschool_params
    params.require(:codeschool).permit(:name, :logo, :description, :url)
  end
end
