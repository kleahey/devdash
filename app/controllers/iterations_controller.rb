class IterationsController < ApplicationController
  def index
    @iterations = Iteration.order(start_date: :desc)
  end

  def show
    @iteration = Iteration.find(params[:id])
  end
end
