class Admin::DescriptionsController < ApplicationController
  before_action :admin_only
  before_action :find_description, only: [:show, :edit, :update, :destroy]

  def index
    @descriptions = Description.all
  end

  def show
  end

  def new
    @description = Description.new
  end

  def create
    @description = Description.new description_params
    if @description.save
      flash[:success] = t(".create_success")
      redirect_to admin_descriptions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @description.update_attributes(params[:description])
      redirect_to admin_descriptions_path, flash[:success] = t(".update_success")
    else
      redirect_to admin_descriptions_path, flash[:error] = t(".update_failed")
    end
  end

  def destroy
    if @description.destroy
      flash[:success] = t(".delete_success")
    else
      flash[:error] = t(".delete_failed")
    end
    redirect_to admin_descriptions_path
  end

  private

  def find_description
    @description = Description.find_by id: params[:id]
    if @description.nil?
      flash[:alert] = t(".find_failed")
      redirect_to admin_descriptions_path
    end
  end

  def description_params
    params.require(:description).permit :director_name, :cast_name
  end
end
