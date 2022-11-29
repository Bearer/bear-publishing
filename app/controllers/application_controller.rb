class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers

  helper_method :current_user

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def current_order
    return unless current_user
    current_user.organization.orders.pending.find_by(id: session[:current_order_id]) ||
    current_organization.orders.new
  end

  def current_organization
    return unless current_user
    @organization ||= current_user.organization
  end

  def require_user!
    Rails.logger.info("current user: #{current_user.email}") if current_user
    return if current_user

    redirect_to "/sign_in", flash: { error: 'You must log in' }
  end
end
