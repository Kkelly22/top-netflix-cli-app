# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application --> The "CLI" class displays a list of shows to choose from.  The user can then interact with this application by choosing a show to see more information.  The user can also re-display the list of shows by typing "list", or choose exit by typing "exit".
- [x] Pull data from an external source --> The "Scrape" class scrapes data from a Huffington Post article "Ranking The Best Shows On Netflix You Can Stream Right Now".  This data is scraped and turned into object instances at the start of this application.  This occurs on line 5 of the CLI class - "TopNetflix::Scraper.make_shows".
- [x] Implement both list and detail views --> The list view is accomplished by using the class variable "@@all" (Show class).  This class variable is populated with each initialization of a show instance.  The detail view is accomplished by using a "find" method.  This simply looks up the chosen show via the index in the "@@all" array, and displays the instance's attributes using dot notation.
