class TopNetflix::Shows
  attr_accessor :name, :creator, :cast, :plot

  @@all = []

  def self.new_from_doc(doc, i, j)
    creator_string = capture_creator(doc, i)
    cast_string = capture_cast(doc, i)
    plot_string = capture_plot(doc, j)
    self.new(
      doc.css(".grid-container p")[i].text.gsub(/[0-9.]/,"").gsub("\r\n    ",""),
      creator_string,
      cast_string,
      plot_string
      )
  end

  def initialize(name = nil, creator = nil, cast = nil, plot = nil)
    @name = name
    @creator = creator
    @cast = cast
    @plot = plot
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(i)
    @@all[i - 1]
  end

  def self.capture_creator(doc, i)
    input_string = doc.css(".grid-container p")[i+1].text
    if input_string.include? "Creators:"
      str1_markerstring = "Creators:"
    else
      str1_markerstring = "Creator:"
    end

    if input_string.include? "Stars:"
      str2_markerstring = "Stars:"
    else
      str2_markerstring = "Star:"
    end

    input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
  end

  def self.capture_cast(doc, i)
     input_string = doc.css(".grid-container p")[i+1].text
     if input_string.include? "Stars:"
      str1_markerstring = "Stars:"
     else
      str1_markerstring = "Star:"
     end

     if input_string.include? "Networks:"
       str2_markerstring = "Networks:"
     else
      str2_markerstring = "Network:"
    end

    input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
  end

  def self.capture_plot(doc, j)
    input_string = doc.css(".grid-container p")[j].text.gsub("\r\n      ", "")
  end

end
