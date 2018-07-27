class ExportPdf < Prawn::Document
  def initialize(homework,presentation_items)
  #  super(top_margin: 70)
    super(page_size: "A4")
    define_grid(:columns => 6, :rows => 21  , :gutter => 5)
    @logo = "#{Rails.root}/app/assets/images/swan_logo.png"
    @homework = homework
    @comments = @homework.comments
    @comments.each do |comment|
      form_header(comment)
      www (comment)
      feedback (comment)
      presentation(comment,presentation_items)
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
          text "\nWhat steps I will take", size: 14, :style => :bold
        end
      }
    end
  end # feedback

  def build_pres_items(presentation_items)
    items_array = []
    categories = []
    headings = []
    ids = []
    presentation_items.each do |pi|
      categories << pi.category
      headings << pi.heading
      ids << pi.id
    end

  end



  def presentation(comment,presentation_items)
    grid([11, 0], [17, 1]).bounding_box do
      stroke_bounds
      pad(12){
        indent (10) do
          text "Presentation", size: 16, :style => :bold
          presentation_items.each do |pres|
            text pres.heading
            text pres.category

          end
        end
      }
    end
  end #presentation

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
