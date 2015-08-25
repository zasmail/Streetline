class LocationsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @location = @group.locations.create(location_params)
    redirect_to group_path(@group)
  end

  private
    def location_params
      params.require(:location).permit(:latitude)
    end
end
