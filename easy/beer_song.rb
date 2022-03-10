=begin

Create three methods
- verse => one argument
- verses => two arguments
- lyrics => none

Lyrics for the 1 and 0 number of bottles will be different from the rest
Possibly use HEREDOC

=end

class BeerSong
  
  BEER_SONG = File.open('song.txt').read
  
  def self.verse(line)
    song = BEER_SONG.split("\n\n").reverse
    song[line] + "\n"
  end
  
  def self.verses(line1, line2)
    song = BEER_SONG.split("\n\n").reverse
    song[line2..line1].reverse.join("\n\n") + "\n"
  end
  
  def self.lyrics
    BEER_SONG + "\n"
  end
end