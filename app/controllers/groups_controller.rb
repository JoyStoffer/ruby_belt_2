class GroupsController < ApplicationController

     before_action :require_login
     def index
          @groups =Group.all
          @user= current_user

     end

     def create
          @group = Group.create(group_params)

          if @group.valid?
               # below is how the current user is auto assigned to the group
               Attend.create(user: current_user, group:@group)
               return redirect_to groups_path
          end
          flash[:errors] = @group.errors.full_messages

          return redirect_to :back
     end
     def show

          @group = Group.find(params[:id])

     end

     def destroy
          @group = Group.find(params[:id])

          @group.destroy

          return redirect_to :back

     end

     private
          def group_params
               params.require(:group).permit(:name, :description).merge(user: current_user)
          end

end
