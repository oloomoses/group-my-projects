class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :require_user

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.order(:name)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @projects = @group.projects
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups
  # POST /groups.json
  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
      else
        render :edit
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    if @group.destroy
      redirect_to groups_url, notice: 'Group was successfully destroyed.'
    else
      redirect_to @group, notice: 'Error! Group delete fail'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:user_id, :project_id, :name, :icon)
  end
end
