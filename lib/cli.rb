require_relative './scrapper'

class Cli
  USAGE = 'USAGE: scrapper url'

  def initialize(url)
    @url = url
  end

  def run
    puts USAGE if url.nil? || url.empty?

    scrapper.scrape
  end

  private

  attr_reader :url

  def scrapper
    @scrapper ||= Scrapper.new(url)
  end
end
