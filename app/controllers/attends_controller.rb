class AttendsController < ApplicationController
     before_action :require_login

     def create
          group_id = params[:attend][:group_id]
          Attend.create(attend_params)

          return redirect_to group_path group_id

     end
     def destroy

          @attend = Attend.find_by(attend_params)
          @attend.destroy

          return redirect_to :back

     end

     private
          def attend_params
               params.require(:attend).permit(:group_id).merge(user: current_user)

          end
end
