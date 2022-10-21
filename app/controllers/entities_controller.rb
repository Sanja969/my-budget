class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
  end

  def create
    @entities = current_user.entities
    @entity = current_user.entities.new(entity_params)
    respond_to do |format|
      if @entity.save
        format.html { redirect_to new_entity_ge_path(@entity.id), notice: 'entity was successfully created.' }
        format.json { render :show, status: :created, location: entity_path(@entity.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def entity_params
    params.require(:entity).permit(:user_id, :name, :amount)
  end
end
