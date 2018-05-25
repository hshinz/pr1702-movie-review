class Admin::DescriptionsController < ApplicationController
  before_action :admin_only
  before_action :find_description, only: [:show, :destroy]

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
      flash[:success] = "Description created"
      redirect_to admin_descriptions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @description.destroy
      flash[:success] = "Description deleted"
    else
      flash[:error] = "Description not deleted"
    end
    redirect_to admin_descriptions_path
  end

  private

  def find_description
    @description = Description.find_by id: params[:id]
    if @description.nil?
      flash[:alert] = "Description not found"
      redirect_to admin_descriptions_path
    end
  end

  def description_params
    params.require(:description).permit :director_name, :cast_name
  end
end
