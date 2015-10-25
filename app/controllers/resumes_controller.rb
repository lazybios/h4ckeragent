class ResumesController < ApplicationController

  before_action :check_passcode, only: [:show]
  before_action :require_user, only: [:index, :edit, :new, :update, :destroy]
  before_action :set_resume, only: [:show, :edit, :destroy, :update]

  def index
    @resumes = current_user.resumes.all
  end

  def show
    if params.key?(:passcode)
      Thread.new do
        bcs = BearyChatService.new @resume.user.slack_webhook
        bcs.deliver(@access.first.remark, @resume.title)
      end
    end
    render :layout => "layouts/resume"
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
    params.require(:resume).permit(:title, :url, :body, :body_origin)
  end

  def check_passcode
    # 查看是否权限为public
    if current_user
      return true
    end

    if params.has_key?(:passcode)
      # 查看失效
      @access = Access.where(passcode: params[:passcode], resume_id: params[:id])
      if @access.blank?
        redirect_to :root, success: "passcode 错误"
      else
        #计数器累加,记录访客来源ip地址,支持添加百度统计,绑定域名
        @access.first.increment!(:click_count)
        #slack webhook 通知事件
      end
    else
      redirect_to :root, success: "passcode 错误"
    end
  end

end
