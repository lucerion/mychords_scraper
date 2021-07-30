require 'mechanize'

class Scrapper
  LINKS_CLASS = 'b-listing__item__link'
  TEXT_CLASS = '.w-words__text'
  TITLE_CLASS = '.b-title--song'

  Song = Struct.new(:title, :text)

  def initialize(favourites_page_url)
    @favourites_page_url = favourites_page_url
  end

  def scrape
    songs_links.map { |song_link| song(song_link.click) }
  end

  private

  attr_reader :favourites_page_url

  def song(song_page)
    Song.new(song_title(song_page), song_text(song_page))
  end

  def song_title(song_page)
    song_page.css(TITLE_CLASS).text.strip
  end

  def song_text(song_page)
    song_page.css(TEXT_CLASS).text
  end

  def songs_links
    @songs_links ||= favourites_page.links_with(class: LINKS_CLASS)
  end

  def favourites_page
    @page ||= client.get(favourites_page_url)
  end

  def client
    @client ||= Mechanize.new
  end
end
