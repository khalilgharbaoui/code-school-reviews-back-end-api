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

  private

  def project_params
    params.require(:codeschool).permit(:name, :logo, :description, :url)
  end
end
