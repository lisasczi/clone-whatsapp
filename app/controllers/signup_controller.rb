class SignupController < ApplicationController
  before_action :user_params

  def create
    user = User.new(user_params)
    if user.save
      payload  = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: {
        csrf: tokens[:csrf],
        user: user,
        token: tokens[:access]
      }
    else
      render json: { error: user.errors.full_messages.join(' Connexion impossible ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:phone_number, :name, :last_name)
  end

end
