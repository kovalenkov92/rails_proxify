module RailsProxify
  class RequestsController < RailsProxify::ApplicationController

    def proxify
      path = params[:path].include?('://') ? params[:path] : params[:path].gsub(':/', '://')

      if %w(get delete).include?(request.method.downcase) && params.any?
        path += '?'
        params.except(:request).each { |key,value| path += "#{key}=#{value}&" }
      end

      req = RailsProxify::Request.new url: path,
                                      method: request.method,
                                      headers: request.headers,
                                      body: params

      if req.execute
        render json: req.result, status: req.response.try(:code)
      else
        render json: {errors: req.errors}, status: req.response.try(:code)
      end
    end

  end
end
