class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
    
  def index
        if logged_in?
        @task= current_user.tasks.build
        @tasks= current_user.tasks.order(id: :desc).page(params[:page])
        end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def create
      @task = current_user.tasks.build(task_params)
      
      if @task.save
          flash[:success]='タスクが正常に登録されました。'
          redirect_to tasks_url
      else
          flash.now[:danger]='タスクが正常に登録されませんでした。'
          render 'tasks/new'
      end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
          flash[:success]='タスクは正常に更新されました。'
          redirect_to task_url
      else
          flash.now[:danger]='タスクは更新されませんでした。'
          render 'users/edit'
      end
  end

  def destroy
      @task = Task.find(params[:id])
      @task.destroy
      
      flash[:success]='タスクは正常に削除されました。'
      redirect_to task_url
  end



private

  def task_params
      params.require(:task).permit(:content,:status)
  end
end
