class BurndownController < ApplicationController
  def index
    if params[:search].blank?
      render 'search'
    else
      # perform search code goes here
      render 'index'
    end
  end
end
