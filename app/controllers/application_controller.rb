class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    rescue_from ActionController::RoutingError, with: :render_not_found

    def catch_404
        raise ActionController::RoutingError.new(params[:path])
    end

    private
    def render_not_found
        render 'layouts/404', status: 404
    end
end
