class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new 
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find { |ele| ele.name == name }
  end

  def self.find_or_create_by_name(name)
    # song = self.find_by_name(name)
    # if song == nil
    #   song = self.create_by_name(name)
    # end
    # song

    # refactor
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |a,b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    file = filename.split(/\ - |.mp3/)
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
