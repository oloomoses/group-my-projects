class ExternalProjectsController < ApplicationController
  before_action :require_user
  def index
    @projects = current_user.projects.order(created_at: :desc)
  end
end
