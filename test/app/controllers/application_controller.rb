class ApplicationController < ActionController::Base
  def index
    render :action => params[:id]
  end
end
