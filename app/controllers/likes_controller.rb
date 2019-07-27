class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, rule_id: params[:rule_id])
    @likes = Like.where(rule_id: params[:rule_id])
    @rules = Rule.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, rule_id: params[:rule_id])
    like.destroy
    @likes = Like.where(rule_id: params[:rule_id])
    @rules = Rule.all
  end
end
