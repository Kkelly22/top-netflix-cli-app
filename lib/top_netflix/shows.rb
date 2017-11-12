class TopNetflix::Shows
  attr_accessor :name, :release_date, :plot, :pros, :cons

  @@all = []

  def self.new_from_doc(doc, i)
    plot_string = capture_plot(doc, i)
    pros_string = capture_pros(doc, i)
    cons_string = capture_cons(doc, i)
    self.new(
      doc.css(".card__badge")[i].text,
      doc.css(".card__headline")[i].text,
      plot_string,
      pros_string,
      cons_string
      )
  end

  def initialize(name = nil, release_date = nil, plot = nil, pros = nil, cons = nil)
    @name = name
    @release_date = release_date
    @plot = plot
    @pros = pros
    @cons = cons
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(i)
    @@all[i - 1]
  end

  def self.capture_plot(doc, i)
    input_string = doc.css(".card__description")[i].text.gsub("\u00A0 ", "\u00A0")
    str1_markerstring = "Plot:"
    str2_markerstring = "Pro:"
    input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
  end

  def self.capture_pros(doc, i)
    input_string = doc.css(".card__description")[i].text.gsub("\u00A0 ", "\u00A0")
    str1_markerstring = "Pro:"
    str2_markerstring = "Con:"
    input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
  end

  def self.capture_cons(doc, i)
    input_string = doc.css(".card__description")[i].text.gsub("\u00A0 ", "\u00A0")
    str1_markerstring = "Con:"
    str2_markerstring = "\n"
    input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
  end

end
