class TasksController < ApplicationController
    
  def index
      @tasks=Task.all
  end

  def show
      @task = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def create
      @task = Task.new(task_params)
      
      if @task.save
          flash[:success]='タスクが正常に登録されました。'
          redirect_to @task
      else
          flash.now[:danger]='タスクが正常に登録されませんでした。'
          render :new
      end
  end

  def edit
      @task = Task.find(params[:id])
  end

  def update
      @task = Task.find(params[:id])
      
      if @task.update(task_params)
          flash[:success]='タスクは正常に更新されました。'
          redirect_to @task
      else
          flash.now[:danger]='タスクは更新されませんでした。'
          reder :edit
      end
  end

  def destroy
      @task = Task.find(params[:id])
      @task.destroy
      
      flash[:success]='タスクは正常に削除されました。'
      redirect_to task_url
  end

end
