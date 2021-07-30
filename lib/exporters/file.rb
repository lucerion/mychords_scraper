require_relative './base'

module Exporters
  class File < Base
    def export(songs)
      ::File.open(path, 'w') do |file|
        songs.each { |song| file.write("#{song.title}\n\n#{song.text}\n\n\n") }
      end
    end
  end
end
