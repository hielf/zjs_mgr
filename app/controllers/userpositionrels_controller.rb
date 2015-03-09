class UserpositionrelsController < ApplicationController
  before_filter :authenticate
  
  # def create
  #   @position = Userposition.find(params[:positionid])
  #   current_user.position!(@position)
  #   respond_to do |format|
  #     format.html { redirect_to @user }
  #     format.js
  #   end
  # end
  
  # def destroy
  #   @user = Relationship.find(params[:id]).followed
  #   current_user.unfollow!(@user)
  #   respond_to do |format|
  #     format.html { redirect_to @user }
  #     format.js
  #   end
  # end
end
