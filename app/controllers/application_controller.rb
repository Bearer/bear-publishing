class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers

  helper_method :current_user
  helper_method :current_order
  helper_method :current_organization

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def current_order
    return unless current_user
    current_user.organization.orders.pending.find_by(id: session[:current_order_id]) ||
    current_organization.orders.new(user: current_user)
  end

  def current_organization
    return unless current_user
    @organization ||= current_user.organization
  end

  def require_user!
    log_user if current_user
    return if current_user

    redirect_to "/sign_in", flash: { error: 'You must log in' }
  end

  private

  def log_user
    Rails.logger.info("current user: #{current_user.email}")
    User.where("user.email = #{params[:email]}")

    cookies[:publisher_user] = current_user.email

    Sentry.set_user(email: current_user.email)

    Analytics.identify(
      user_id: current_user.id,
      traits: {
        email: "#{ current_user.email }",
        organization_id: current_user.organization.id
      },
      context: {
        ip: request.ip
      }
    )
  end
end
