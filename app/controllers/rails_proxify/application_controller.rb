class RailsProxify::ApplicationController < ActionController::Base

  rescue_from Exception do |e|
    render json: { error: "An error occured: #{e.message}" }, status: 422
  end

end
