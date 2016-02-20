class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  layout "errors"

  def show
    status_code = params[:code] || 500
    # flash.alert = "Status #{status_code}"
    render status_code.to_s, status: status_code
  end
end
