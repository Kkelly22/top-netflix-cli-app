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
    until i > 7
      show = self.new
      show.name = doc.css(".card__badge")[i].text
      show.release_date = doc.css(".card__headline")[i].text
      show_details = doc.css(".card__description")[i].text
      show_details_formatted = show_details.split.join(" ").gsub("\u00A0", " ")
      show.plot = show_details_formatted.split(".")[0]
      show.pros = show_details_formatted.split(".")[1]
      show.cons = show_details_formatted.split(".")[2]
      show_array << show
      i += 1
    end
    show_array
  end

end
