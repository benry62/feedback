class StudentReportPdf < Prawn::Document

  def initialize(comments, presentation_items)
  #  super(top_margin: 70)
    super(top_margin: 70,
          page_size: "A4",
          page_layout: :landscape)
    @logo = "#{Rails.root}/app/assets/images/swan_logo.png"
    font_families.update("zapfdingbats" => {:normal => "#{Rails.root}/app/assets/fonts/zapfdingbats.ttf"} )
    @comments = comments
    @student = @comments.first.student
    @presentation_items = presentation_items

    set_header
    @comments.each do |comment|
      print_homework_title(comment)
      print_comments(comment)
    end
    start_new_page

  end

  def set_header
    image @logo, width: 75, position: :right
    move_up 75
    text @student.first_name + ' ' + @student.last_name, size: 20, style: :bold
    text @student.class_group.name, size: 15
    text "Report date: " + Date.today.strftime("%d %b %y"), size: 15
    move_down 25
  end

  def print_homework_title(comment)
    text comment.homework.title + ' ' + comment.homework.date.strftime("%d %b %y"), size: 15, style: :bold
  end

  def print_comments(comment)
    table([ ["Comments", "Homework", "Dirt", "Spelling", "Presentation" ]],:column_widths => [240, 180, 100, 100, 120], :cell_style => { :font_style => :bold, :size =>11,:align => :center} )
    table([ [comment.www, comment.area_for_development, comment.dirt, comment.spelling, "" ]],:column_widths => [240, 180, 100, 100, 120], :cell_style => {:height => 200})
    move_up 200
    indent(618) do
      presentation(comment)
    end
    move_down 20
  end



  def build_pres_items_hash
    categories  = {}
    headings    = {}
    ids         = {}
    i           = 0
    @presentation_items.each do |pi|
      categories[i] = pi.category
      headings[i]   = pi.heading
      ids[i]        = pi.id
      i += 1
    end
    return ids, headings, categories
  end


  def checked (id_array, id)
    id_array.include?(id) ? "3 " : "7 "
  end

  def pres_items_ids (comment)
    # builds array of presentation_item_id for a given comment
    id_array = []
    comment.presentations.each do |p|
      id_array << p.presentation_item_id
    end
    id_array
  end

  def write_categories(id_array, ids, categories, i)
    indent (20) do
      font("zapfdingbats") do
        text checked(id_array, ids[i])
      end
      move_up 11
      indent (12) do
        text categories[i]
      end
    end # intent
  end


  def presentation(comment)
      ids, headings, categories = build_pres_items_hash
      id_array = pres_items_ids (comment)

      pad(10){
        indent (10) do
          text headings[0], size: 12, :style => :bold
          indent (20) do
            first_cat = checked(id_array, ids[0]) + categories[0]
            font("zapfdingbats") do
              text checked(id_array, ids[0])
            end
            move_up 11
            indent (12) do
              text categories[0]
            end
          end
          for i in 1..ids.length-1 do
            #step through the arrays.
            #put the first title. Then check to see if the next title is
            #the same. If it is then put the first category
            #check the id. If the id is in the comment.presentation.presentation_item_ids
            #then write a tick. If not write a cross.

            #Then move along to the next item.
            if headings[i] == headings[i-1]
              write_categories(id_array, ids, categories, i)
              i += 1
            else
              text headings[i], size: 12, :style => :bold
              write_categories(id_array, ids, categories, i)
            end #if
          end #for
        end # indent
      } #pad
    #read_box(93)
  end #presentation





end
