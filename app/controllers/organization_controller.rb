class OrganizationController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :require_user!

  def index
  end

end