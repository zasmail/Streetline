class GroupsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show]
  
  def index
    @groups = Group.where(kind: 'block').order("id").page(params[:page])
    # @locations = @groups.all.each do |group| group["location"] end
    @hash = Gmaps4rails.build_markers(@groups.map(&:location)) do |location, marker|
      marker.lat location[0]['latitude']
      marker.lng location[0]['longitude']
      group = Group.find(location[0]['group_id'])
      marker.infowindow("#{group['title']}: #{group.avaliable_spaces}/#{group.spaces.size} spaces are avaliable spaces")
    end
  end  

  def show
    @group = Group.find(params[:id])
    @spaces = Space.where(group_id: @group.id)
  end

  def new
    @group = Group.new
  end
  
  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
   
    if @group.save
        redirect_to @group
    else
        render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])
   
    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
end

def destroy
  @group = Group.find(params[:id])
  @group.destroy
  redirect_to groups_path
end 
   
private
  def group_params
    params.require(:group).permit(:title, :kind)
  end
end
