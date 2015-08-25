class SpacesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "password"

  def create
    @group = Group.find(params[:group_id])
    @space = @group.spaces.create(space_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @space = @group.spaces.find(params[:id])
    @space.destroy
    redirect_to group_path(@group)
  end
 
  private
    def space_params
      params.require(:space).permit(:policy)
    end
end
