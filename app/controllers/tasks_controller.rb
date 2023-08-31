class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
    # respond_to do |format|
    #   if @task
    #     format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
    #     format.json { render :index, status: :ok, location: @task }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:"#{dom_id @task}", partial: 'card', locals: { task: @task})
        end
        
        format.html { redirect_to '/', notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /posts or /posts.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:tasks, tasks_url);
        end
        format.html { redirect_to '/', notice: "Task was successfully created." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(:tasks, tasks_url);
        end
        format.html { redirect_to tasks_url, status: :unprocessable_entity, notice: "Task can't have empty title" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /posts/1 or /posts/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }

    end
  end

  def complete
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update!(completed: !@task.completed)
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(:"#{dom_id @task}_toogle", partial: 'completed_toggle', locals: { task: @task})
        end
        
        format.html { redirect_to tasks_url, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :due_date, :completed)
    end
end
