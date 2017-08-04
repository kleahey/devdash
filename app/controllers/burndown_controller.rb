class BurndownController < ApplicationController

  def index
    @title = Sprint.find_by_id(params[:sprint])
    @dates = Task.select("date(historical_date) as date").where(sprint_id: params[:sprint]).order("date(historical_date)").group("date(historical_date)")
    @webapp = Task.select("task_hours as hours").where(sprint_id: params[:sprint], project_id: 41877373746)
    @tcc = Task.select("task_hours as hours").where(sprint_id: params[:sprint], project_id: 49069534069)
    @ontrack = Task.select("task_hours as hours").where(sprint_id: params[:sprint], project_id: 36762812213)
    @analytics = Task.select("task_hours as hours").where(sprint_id: params[:sprint], project_id: 130195603136)
    if params[:search].blank?
      render 'search'
    else
      # perform search code goes here
      render 'index'
    end

  end

  private

  def sprint_params
    params.require(:sprint).permit(:id, :name, :start_date, :end_date)
  end

end
