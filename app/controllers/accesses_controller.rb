class AccessesController < ApplicationController

  before_action :set_access, only: [:edit, :update, :show, :destroy]

  def new
    @access = Access.new
  end

  def create
    @access = current_user.accesses.new(access_params)
    if @access.save
      redirect_to :accesses, success: "PASSCODE生成成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @access.update(access_params)
      redirect_to :accesses, success: "更新成功"
    else
      render :edit, fail: "更新失败"
    end
  end

  def index
    @accesses = current_user.accesses.all.order(is_invalid: :asc)
  end

  def show
  end

  def destroy
    @access.destroy
    redirect_to :accesses, success: "删除成功"
  end

  def set_invalid
    @access = Access.find_by_id(params[:access_id])
    @access.update_attribute(:is_invalid, true)
    redirect_to :accesses
  end

  def set_valid
    @access = Access.find_by_id(params[:access_id])
    @access.update_attribute(:is_invalid, false)
    redirect_to :accesses
  end

  private

  def set_access
    @access = Access.find_by_id(params[:id])
  end

  def access_params
    params.require(:access).permit(:remark, :expire_at)
  end
end
