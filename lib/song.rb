require 'pry'

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song = Song.new
    song_array = file.split(" - ")
    song.name = song_array[1].chomp(".mp3")
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    @@all << song
  end

  def self.destroy_all
    self.all.clear
  end

end



# p Song.create
# p Song.all
song_1 = Song.create_by_name("Blank Space")
song_2 = Song.create_by_name("Hello")
song_3 = Song.create_by_name("Hotline Bling")
song_4 = Song.create_by_name("Zoot")


# p Song.find_by_name("Hello")
# p Song.find_or_create_by_name("Hello")
# p Song.alphabetical
song_5 = Song.new_from_filename("Thundercat - For Love I Come.mp3")
# Song.create_from_filename("Thundercat - For Love I Come.mp3")
