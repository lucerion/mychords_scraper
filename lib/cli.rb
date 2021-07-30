require_relative './scrapper'
require_relative './exporter'

class Cli
  USAGE = 'USAGE: scrapper url'
  DEFAULT_FILE_PATH = './songs'

  def initialize(url)
    @url = url
  end

  def run
    puts USAGE if url.nil? || url.empty?

    exporter.export(scrapper.scrape)
  end

  private

  attr_reader :url

  def scrapper
    @scrapper ||= Scrapper.new(url)
  end

  def exporter
    @exporter ||= Exporter.new(DEFAULT_FILE_PATH)
  end
end
