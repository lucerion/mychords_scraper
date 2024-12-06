# frozen_string_literal: true

require_relative './scrapper'
require_relative './exporter'

class Cli
  USAGE = 'USAGE: scrapper URL'
  DEFAULT_FILE_PATH = './songs.txt'

  def initialize(favourites_page_url)
    @favourites_page_url = favourites_page_url
  end

  def run
    puts USAGE if favourites_page_url.nil? || favourites_page_url.empty?

    exporter.export(scrapper.scrape)
  end

  private

  attr_reader :favourites_page_url

  def scrapper
    @scrapper ||= Scrapper.new(favourites_page_url)
  end

  def exporter
    @exporter ||= Exporter.new(DEFAULT_FILE_PATH)
  end
end
