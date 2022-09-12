class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def current_user
    return unless request.headers.include? "Authorization"

    @current_user ||= User.find(params['user_id'])
  end


  def not_authorized
    render json: { error: 'Pas autorisé' }, status: :unauthorized
  end
end
