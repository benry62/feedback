class HomeworkReportPdf < Prawn::Document
  def initialize(homework, comments, students)
  #  super(top_margin: 70)
    super(page_size: "A4")
#    define_grid(:columns => 13, :rows => 30  , :gutter => 5)
    @logo = "#{Rails.root}/app/assets/images/swan_logo.png"
    font_families.update("zapfdingbats" => {:normal => "#{Rails.root}/app/assets/fonts/zapfdingbats.ttf"} )

    # set up the variables going to use
    @homework = homework
    @comments = comments
    @students = students
    merits = @homework.get_attribute("merit")
    resubmits = @homework.get_attribute("resubmit")
    not_submitteds = @homework.get_attribute("not_submitted")

    #build the arrays to make the tables
    note_data = Array.new
    comment_data = Array.new
    @comments.each do |comment|
      text = ''
      unless comment.note.nil?
        text = comment.note.text
        comment_data << [comment.student.first_name + " " + comment.student.last_name,comment.result, text]
      end
    end # comments.each

    flagged_students = Array.new
    @students.each do |student|
      if student.flag == true
        flagged_students << [ student.first_name + " " + student.last_name]
      end
    end

    #call the functions to build the page
    form_header
    move_down 5
    list_merits(merits)
    list_resubmits(resubmits)
    list_not_submitteds(not_submitteds)
    list_flagged(flagged_students)
    move_down 5
    unless comment_data.size == 0
      list_notes(comment_data)
    end
    move_down 10
    list_resubmit_comments(resubmits)
  #  list_notes(note_data)
  end #initialize



  def form_header
    y_position = cursor
    bounding_box([0, y_position], :width => 1200) do
       pad(10) {
        indent(10) do
          text @homework.class_group.name + " " + @homework.title, size: 14, :style => :bold
          text @homework.date.strftime("%d %b %y"), size: 12
        end
      }
    end
  end #form_header

  def list_merits(merits)
    y_position = cursor
    bounding_box([0, y_position], :width => 280) do
      pad(8){
        indent (10) do
          text "Merits:" + " " + merits.count.to_s, size: 12, :style => :bold
          merits.each do |m|
            text m.student.full_name, size: 11
          end #do
        end #indent
      }
    end #bounding_box
  end #method


  def list_resubmits(resubmits)
    bounding_box([130, 715], :width => 280) do
      pad(8){
        indent (10) do
          text "Resubmit:" + " " + resubmits.count.to_s, size: 12, :style => :bold
          resubmits.each do |m|
            text m.student.full_name, size: 11
          end #do
        end #indent
      }
    end #bounding_box
  end #method

  def list_not_submitteds(not_submitteds)
    bounding_box([270, 715], :width => 280) do
      pad(8){
        indent (10) do
          text "Not submitted:" + " " + not_submitteds.count.to_s, size: 12, :style => :bold
          not_submitteds.each do |m|
            text m.student.full_name, size: 11
          end #do
        end #indent
      }
    end #bounding_box
  end #method

  def list_flagged(flagged_students)
    bounding_box([400, 715], :width => 280) do
      pad(8){
        indent (10) do
          text "Flagged:" + " " + flagged_students.count.to_s, size: 12, :style => :bold
          c = 0
          flagged_students.each {|m|
            text m[0], size: 11
            c+=1
          }
        end #indent
      }
    end #bounding_box
  end #method


  def list_notes(comment_data)
    y_position = cursor+25
    bounding_box([0, y_position-100], :width => 1200) do
      text "Flagged comments", size: 12, :style => :bold
      build_table(comment_data, 150, 25)
    end # do
  end #method


  def list_resubmit_comments(resubmits)
    resubmits_data = Array.new
    resubmits.each do |resubmit|
      text = ''
      unless resubmit.area_for_development.nil?
        resubmits_data << [resubmit.student.first_name + " " + resubmit.student.last_name, resubmit.area_for_development]
      end
    end # comments.each

    y_position = cursor+50
    text "Resubmitted comments", size: 12, :style => :bold
    build_table(resubmits_data, 150, 350)
  end

  def build_table(data, col1, col2)
    t = table(data,
      :cell_style => {:size => 11},
      :row_colors => ["F0F0F0", "FFFFFF"],
      :column_widths => [col1, col2]
    )
  end








end #class
