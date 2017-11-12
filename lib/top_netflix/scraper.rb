class TopNetflix::Scraper

  def self.make_shows
    url = "https://www.huffingtonpost.com/entry/netflix-streamline_us_59f9e246e4b046017fb05974"
    doc = Nokogiri::HTML(open(url))

    i = 0
    until doc.css(".card__badge")[i] == nil
      TopNetflix::Shows.new_from_doc(doc, i)
      i += 1
    end
  end

end
