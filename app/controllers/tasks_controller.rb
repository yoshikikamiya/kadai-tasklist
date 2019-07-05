def index
    @tasks = Task.order(id: :desc).page(params[:page]).per(3)
end