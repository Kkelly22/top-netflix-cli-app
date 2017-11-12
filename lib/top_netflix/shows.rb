class TopNetflix::Shows
  attr_accessor :name, :release_date, :plot, :pros, :cons

  def self.Today
    self.scrape_shows
  end

  def self.scrape_shows
    url = "https://www.huffingtonpost.com/entry/netflix-streamline_us_59f9e246e4b046017fb05974"
    doc = Nokogiri::HTML(open(url))

    show_array = []
    i = 0
    until doc.css(".card__badge")[i] == nil
      show = self.new
    #Name
      show.name = doc.css(".card__badge")[i].text
    #Release Date
      show.release_date = doc.css(".card__headline")[i].text
    #Plot
      input_string = doc.css(".card__description")[i].text.gsub("\u00A0 ", "\u00A0")
      str1_markerstring = "Plot:"
      str2_markerstring = "Pro:"
      show.plot = input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
    #Pros
      input_string = doc.css(".card__description")[i].text.gsub("\u00A0 ", "\u00A0")
      str1_markerstring = "Pro:"
      str2_markerstring = "Con:"
      show.pros = input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]
    #Cons
      input_string = doc.css(".card__description")[i].text.gsub("\u00A0 ", "\u00A0")
      str1_markerstring = "Con:"
      str2_markerstring = "\n"
      show.cons = input_string[/#{str1_markerstring}(.*?)#{str2_markerstring}/m, 1]

      show_array << show
      i += 1
    end
    show_array
  end

end
