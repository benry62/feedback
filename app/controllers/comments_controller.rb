class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :get_homework

  # GET /comments
  # GET /comments.json
  def index
  @comments =   Comment.joins(:student).merge(Student.order(last_name: :asc).where("is_current = ?", true)).where("homework_id = ? ", @homework.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ExportPdf.new(@homework, PresentationItem.all)
        send_data pdf.render,
          filename: @homework.class_group.name + "_Homework_" + @homework.date.strftime("%d_%b_%y") + ".pdf",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_to do |format|
      format.html
      format.json {render :show}
      format.js {render :show}
    end
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @students = @homework.class_group.students.where("is_current = ?", true).sort_by{ |m| m.last_name.downcase }
    @comment.presentations.build
  end

  # GET /comments/1/edit
  def edit
    @comment.build_note if @comment.note.nil?

  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.set_flag(params[:flag])
    @comment.homework_id = @homework.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to homework_comments_url, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js { redirect_to homework_comments_url(), notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
#        @comment.delete_empty_notes
        @comment.set_flag(params[:flag])
        format.html { redirect_to homework_comments_url(), notice: 'Comment was successfully updated.' }
        format.js {render :index}
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to homework_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def get_homework
      @homework = Homework.find(params[:homework_id])
      @students = @homework.class_group.students.where("is_current = ?", true).sort_by{ |m| m.last_name.downcase }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(
        :student_id,
        :date,
        :title,
        :grade,
        :result,
        :www,
        :area_for_development,
        :dirt,
        :spelling,
        :homework_id,
        :resubmit,
        :merit,
        :not_submitted,
        note_attributes: [:text],
        presentation_item_ids: []

        )
    end

end
