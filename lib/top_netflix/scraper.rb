class TopNetflix::Scraper

  def self.make_shows
 	url = "https://www.pastemagazine.com/articles/2018/01/the-75-best-tv-shows-on-netflix-2018.html?p=2"
    doc = Nokogiri::HTML(open(url))

    i = 0
    j = 2
  	until  doc.css(".grid-container p")[i] == nil
      TopNetflix::Shows.new_from_doc(doc, i, j)
      i += 3
      j += 3
    end
  end
end
