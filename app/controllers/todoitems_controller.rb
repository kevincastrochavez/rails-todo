class TodoitemsController < ApplicationController
  before_action :set_todoitem, only: %i[ show edit update destroy ]

  # GET /todoitems or /todoitems.json
  def index
    sort_by = params[:sort_by]
    sort_direction = sort_direction(sort_by)
    @todoitems = Todoitem.where(completed: false).order(updated_at: :desc)
    @completed_todoitems = Todoitem.where(completed: true).order(updated_at: :desc)
    sort_todoitems(sort_by, sort_direction)
  end

  # GET /todoitems/1 or /todoitems/1.json
  def show
  end

  # GET /todoitems/new
  def new
    @todoitem = Todoitem.new
  end

  # GET /todoitems/1/edit
  def edit
  end

  # POST /todoitems or /todoitems.json
  def create
    @todoitem = Todoitem.new(todoitem_params)

    respond_to do |format|
      if @todoitem.save
        format.html { redirect_to todoitems_url, notice: "Your Todo was successfully created." }
        format.json { render :show, status: :created, location: @todoitem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todoitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todoitems/1 or /todoitems/1.json
  def update
    respond_to do |format|
      if @todoitem.update(todoitem_params)
        format.html { redirect_to todoitem_url(@todoitem), notice: "Your Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todoitem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todoitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todoitems/1 or /todoitems/1.json
  def destroy
    @todoitem.destroy!

    respond_to do |format|
      format.html { redirect_to todoitems_url, notice: "Your Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoitem
      @todoitem = Todoitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todoitem_params
      params.require(:todoitem).permit(:name, :description, :deadline, :completed)
    end

    # Sort todoitems by deadline and name
    def sort_todoitems(sort_by, sort_direction)
      case sort_by
      when 'namePending'
        @todoitems = sort_direction == 'asc' ? Todoitem.where(completed: false).order(name: :asc) : Todoitem.where(completed: false).order(name: :desc)
      when 'nameCompleted'
        @completed_todoitems = sort_direction == 'asc' ? Todoitem.where(completed: true).order(name: :asc) : Todoitem.where(completed: true).order(name: :desc)
      when 'deadlinePending'
        @todoitems = sort_direction == 'asc' ? Todoitem.where(completed: false).order(deadline: :asc) : Todoitem.where(completed: false).order(deadline: :desc)
      when 'deadlineCompleted'
        @completed_todoitems = sort_direction == 'asc' ? Todoitem.where(completed: true).order(deadline: :asc) : Todoitem.where(completed: true).order(deadline: :desc)
      else
        # Default sorting
        @todoitems = @todoitems.order(created_at: :desc)
        @completed_todoitems = @completed_todoitems.order(created_at: :desc)
      end
    end

    # Set the sort direction
    def sort_direction(sort_by)
      if params[:sort_by] == sort_by && params[:sort_direction] == 'asc'
        'asc'
      else
        'desc'
      end
    end

    def toggle_direction(current_sort_by, target_sort_by)
      current_sort_by == target_sort_by && params[:sort_direction] == 'asc' ? 'desc' : 'asc'
    end
end
