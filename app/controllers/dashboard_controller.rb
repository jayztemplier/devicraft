class DashboardController < ApplicationController
  before_filter :set_server

  def index
    @status = @server.status
    @users = @server.list
  end

  def start
    response = @server.start
    redirect_to dashboard_path, notice: response
  end

  def stop
    response = @server.stop
    redirect_to dashboard_path, notice: response
  end

  def say
    message = params[:message]
    response = @server.say message
    redirect_to dashboard_path, notice: response
  end

  def give
    response = @server.give(params[:user], params[:object], params[:number])
    redirect_to dashboard_path, notice: response
  end

  protected
  def set_server
    @server = Devicraft::Server.new
  end
end
