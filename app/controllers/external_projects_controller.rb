class ExternalProjectsController < ApplicationController
  before_action :require_user
  def index
    @projects = current_user.projects
  end
end
