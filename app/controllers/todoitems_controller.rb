class TodoitemsController < ApplicationController
  before_action :set_todoitem, only: %i[ show edit update destroy ]

  # GET /todoitems or /todoitems.json
  def index
    @todoitems = Todoitem.all
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
        format.html { redirect_to todoitem_url(@todoitem), notice: "Todoitem was successfully created." }
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
        format.html { redirect_to todoitem_url(@todoitem), notice: "Todoitem was successfully updated." }
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
      format.html { redirect_to todoitems_url, notice: "Todoitem was successfully destroyed." }
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
end
