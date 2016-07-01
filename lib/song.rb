class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    #self.all << song
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name)
    create_song = self.create_by_name(song_name)
    found_song ? found_song : create_song
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    file_array = filename.split(/[.]|[-]/).map{|x| x.strip}
    song = self.find_or_create_by_name(file_array[1])
    song.artist_name = file_array[0]
    song
  end

  def self.create_from_filename(filename)
    file_array = filename.split(/[.]|[-]/).map{|x| x.strip}
    song = self.find_or_create_by_name(file_array[1])
    song.artist_name = file_array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
