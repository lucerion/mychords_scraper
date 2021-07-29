require 'mechanize'

class Scrapper
  LINKS_CLASS = 'b-listing__item__link'
  TEXT_CLASS = '.w-words__text'
  TITLE_CLASS = '.b-title--song'

  Song = Struct.new(:title, :text)

  def initialize(url)
    @url = url
  end

  def scrape
    songs_links.map { |song_link| song(song_link.click) }
  end

  private

  attr_reader :url

  def song(song_page)
    Song.new(song_page.css(TITLE_CLASS).text.strip, song_page.css(TEXT_CLASS).text)
  end

  def songs_links
    @songs_links ||= page.links_with(class: LINKS_CLASS)
  end

  def page
    @page ||= client.get(url)
  end

  def client
    @client ||= Mechanize.new
  end
end
