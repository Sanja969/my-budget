class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.search(params[:search])
    @groups = current_user.groups if @groups == []
  end

  def show
    @group = current_user.groups.find(params[:id])
    @transactions = []
    @group.ges.order('id DESC').each do |ge|
      @transactions << Entity.find(ge.entity_id)
    end
    if @transactions.include? current_user.entities.search(params[:search])[0]
      @transactions = current_user.entities.search(params[:search])
    end

    @transactions.each do |t, index|
      @transactions -= [t] unless Ge.where(entity_id: t.id).include? @group.ges.find_by(entity_id: t.id)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'group was successfully created.' }
        format.json { render :show, status: :created, location: user_group_path(current_user, @group.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def group_params
    params.require(:group).permit(:user_id, :name, :image, :search)
  end
end
