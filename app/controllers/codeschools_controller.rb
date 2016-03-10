class CodeschoolsController < ApplicationController
  # main index
  def index
    codeschools = Codeschool.order(id: :asc)
    render json: {
      meta: {
        count: Codeschool.count,
        page: 0
      },
      codeschools: codeschools.as_json({include: :reviews, methods: :average_rating})
    }
  end

  # singular show page
  def show
    codeschool = Codeschool.find(params[:id])
    average_rating = codeschool.average_rating
    render json: {
       codeschool: codeschool,
       average_rating: average_rating
    }
  end

  # create methode
  def create
    if codeschool = Codeschool.create(codeschool_params)
      render json: { codeschool: codeschool }
    else
      render json: {
        message: 'Could not create a new codeschool',
        errors: codeschool.errors
      }, status: :unprocessible_entity
    end
  end

  # update methode
  def update
    codeschool = Codeschool.find(params[:id])

    if codeschool.update(codeschool_params)
      render json: { codeschool: codeschool }
    else
      render json: {
        message: 'Could not update the codeschool',
        errors: codeschool.errors
      }, status: :unprocessible_entity
    end
  end

  # destroy methode

  def destroy
    codeschool = Codeschool.find(params[:id])
    if codeschool.destroy
      render json: { codeschool: nil }
    else
      render json: {
        message: 'Could not destroy the codeschool, please try again'
      }, status: :unprocessible_entity
    end
  end

  # private params area
  private



  def codeschool_params
    params.require(:codeschool).permit(:name, :logo, :description, :url)
  end
end
