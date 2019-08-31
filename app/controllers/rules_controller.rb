class RulesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!,only: [:create, :new,]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @rules = Rule.order("created_at DESC").page(params[:page]).per(4)
    # @rules = Rule.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    @like = Like.new
  end

  def new
  end

  def create
    # Rule.create(rule1:)
    # @rules = rule_params[:text]
    # @rules.each do |rule| 
    # end
    @rule = Rule.new(rule_params)
    @rule.user_id = current_user.id
    if @rule.save
      redirect_to controller: :rules, action: :index
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @rule = Rule.find(params[:id])
  end

  def destroy
    @rule = Rule.find(params[:id])
    if rule.user_id == current_user.id
    @rule.destroy
    redirect_to action: :index
    end
  end

  private
  def rule_params
    params.permit(:name,:rule1,:rule2,:rule3,:rule4,:rule5,:rule6,:rule7)
  end
end
