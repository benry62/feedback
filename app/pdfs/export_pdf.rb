class ExportPdf < Prawn::Document
  def initialize(homework,presentation_items)
  #  super(top_margin: 70)
    super(page_size: "A4")
    define_grid(:columns => 6, :rows => 21  , :gutter => 5)
    @logo = "#{Rails.root}/app/assets/images/swan_logo.png"
    font_families.update("zapfdingbats" => {:normal => "#{Rails.root}/app/assets/fonts/zapfdingbats.ttf"} )


    @homework = homework
    @comments = @homework.comments
    @presentation_items = presentation_items
    @comments.each do |comment|
      form_header(comment)
      www (comment)
      feedback (comment)
      presentation(comment)
      dirt(comment)
      spelling (comment)
      start_new_page
    end
  end

  def form_header(comment)
    grid([0, 0], [1, 5]).bounding_box do
      stroke_bounds
    end

    grid([0, 0], [1, 2]).bounding_box do
      pad(12) {
        indent(10) do
          text comment.student.first_name + " " + comment.student.last_name, size: 14
          text "Topic: " + @homework.title, size: 14
        end
      }
    end

    grid([0, 2], [1, 3]).bounding_box do
      pad(12){
        text @homework.class_group.name, size: 14, :align => :center
      }
    end

    grid([0, 5], [1, 5]).bounding_box do
      pad(12) {
        text @homework.date.strftime("%d %b %y"), size: 14, :align => :center
      }
    end

  end

  def www(comment)
    grid([2, 0], [5, 5]).bounding_box do
      stroke_bounds
      pad(12){
        indent (10) do
          text "General comments", size: 16, :style => :bold
          text comment.www, size: 14
        end
      }
    end
  end #www

  def feedback(comment)

    grid([6, 0], [10, 5]).bounding_box do
      stroke_bounds
    end

    grid([6, 0], [10, 2]).bounding_box do
      stroke_bounds
      pad(12){
        indent (10) do
          text "Feedback", size: 16, :style => :bold
          text "Area for development", size: 14, :style => :bold
          text comment.area_for_development, size: 14
        end
      }
    end

    grid([6, 3], [10, 5]).bounding_box do
      pad(12){
        indent (10) do
          text "\nSteps I will take", size: 14, :style => :bold
        end
      }
    end
  end # feedback

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



  def presentation(comment)
    grid([11, 0], [17, 1]).bounding_box do
      stroke_bounds
      cat = ""
      ids, headings, categories = build_pres_items_hash
      id_array = pres_items_ids (comment)

      pad(12){
        indent (10) do
          text "Presentation", size: 16, :style => :bold
          text headings[0], size: 14, :style => :bold
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
              indent (20) do
                font("zapfdingbats") do
                  text checked(id_array, ids[i])
                end
                move_up 11
                indent (12) do
                  text categories[i]
                end
#                text checked(id_array, ids[i]) + categories[i]
              end # intent
              i += 1
            else
              text headings[i], size: 14, :style => :bold
              indent (20) do
                font("zapfdingbats") do
                  text checked(id_array, ids[i])
                end
                move_up 11
                indent (12) do
                  text categories[i]
                end
              end #do
            end #if
          end #for
        end # indent
      } #pad
    end #grid
  end #presentation

  def dirt(comment)
    grid([11, 2], [17, 5]).bounding_box do
      stroke_bounds
      pad(12){
        indent (10) do
          text "DIRT", size: 16, :style => :bold
          text comment.dirt, size: 14
        end
      }
    end




  end



  def spelling(comment)
    grid([18, 0], [20, 5]).bounding_box do
      stroke_bounds
      pad(12){
        indent (10) do
          text "Spelling", size: 16, :style => :bold
          text comment.spelling, size: 14
        end
      }
    end

  end





end #class
