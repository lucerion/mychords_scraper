require_relative './base'

module Exporters
  class File < Base
    TITLE_SEPARATOR = "\n\n"
    SONGS_SEPARATOR = "\n\n\n"

    def export(songs)
      ::File.open(file_path, 'w') { |file| write_songs(songs, file) }
    end

    private

    def write_songs(songs, file)
      songs.each { |song| write_song(song, file) }
    end

    def write_song(song, file)
      file.write("#{song_title(song.title)}#{TITLE_SEPARATOR}#{song.text}#{SONGS_SEPARATOR}")
    end

    def song_title(title)
      title.strip
    end
  end
end
