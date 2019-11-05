class Artist
  attr_accessor :name
  
  @@artists = []
  
  def initialize(name)
    @name = name
    @@artists << self
  end
  
  def self.artists
    @@artists
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select{|song|song.artist == self}
  end
  
  def add_song_by_name(name)
    song = Song.new(name)
    add_song(song)
  end
  
  def self.song_count
    song_count = self.artists.collect{|artist|artist.songs}
    song_count.flatten.count
  end
  
end