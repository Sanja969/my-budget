class GesController < ApplicationController
  def index; end

  def new
    @ge = Ge.new
    @entity = current_user.entities.find(params[:entity_id])
    @groups = []
    current_user.groups.each do |group|
      @groups << [group.name, group.id]
    end
  end

  def create
    @entity = current_user.entities.find(params[:entity_id])
    @groups = Group.all
    @ge = @entity.ges.new(
      entity: @entity,
      group_id: ge_params[:group_id]
    )
    respond_to do |format|
      if @ge.save
        format.html { redirect_to group_path(Group.includes(:ges).find(ge_params[:group_id])), notice: 'ingridiant was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def ge_params
    params.require(:ge).permit(:group_id, :entity_id)
  end
end
