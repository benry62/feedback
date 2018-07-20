class PresentationItemsController < ApplicationController
  before_action :set_presentation_item, only: [:show, :edit, :update, :destroy]

  # GET /presentation_items
  # GET /presentation_items.json
  def index
    @presentation_items = PresentationItem.all
  end

  # GET /presentation_items/1
  # GET /presentation_items/1.json
  def show
  end

  # GET /presentation_items/new
  def new
    @presentation_item = PresentationItem.new
  end

  # GET /presentation_items/1/edit
  def edit
  end

  # POST /presentation_items
  # POST /presentation_items.json
  def create
    @presentation_item = PresentationItem.new(presentation_item_params)

    respond_to do |format|
      if @presentation_item.save
        format.html { redirect_to @presentation_item, notice: 'Presentation item was successfully created.' }
        format.json { render :show, status: :created, location: @presentation_item }
      else
        format.html { render :new }
        format.json { render json: @presentation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentation_items/1
  # PATCH/PUT /presentation_items/1.json
  def update
    respond_to do |format|
      if @presentation_item.update(presentation_item_params)
        format.html { redirect_to @presentation_item, notice: 'Presentation item was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation_item }
      else
        format.html { render :edit }
        format.json { render json: @presentation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentation_items/1
  # DELETE /presentation_items/1.json
  def destroy
    @presentation_item.destroy
    respond_to do |format|
      format.html { redirect_to presentation_items_url, notice: 'Presentation item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation_item
      @presentation_item = PresentationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_item_params
      params.require(:presentation_item).permit(:category)
    end
end
