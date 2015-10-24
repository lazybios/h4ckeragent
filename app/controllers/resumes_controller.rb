class ResumesController < ApplicationController

  before_action :set_resume, only: [:show, :edit, :destroy, :update]

  def index
    @resumes = current_user.resumes.all
  end

  def show
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to :resumes, success: "更新简历成功"
    else
      render :edit
    end
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = current_user.resumes.new(resume_params)
    if @resume.save
      redirect_to :resumes, success: "创建简历成功"
    else
      render :new
    end
  end

  def destroy
    @resume.destroy
    redirect_to :resumes, success: "删除简历成功"
  end



  private

  def set_resume
    @resume = Resume.find_by_id(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:title, :url, :body)
  end
end
