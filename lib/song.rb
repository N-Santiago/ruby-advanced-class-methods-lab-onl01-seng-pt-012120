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
    self.all << song
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
       self.all.find {|song| song.name == name}
   end
   
   def self.find_or_create_by_name(name)
     if self.find_by_name(name) == nil 
        self.create_by_name(name)
      else
        self.find_by_name(name)
      end
    end
    
    def self.alphabetical
      sorted = self.all.sort_by { |song| song.name } #declared sorted for returning the songs in alphabetical order 
      sorted
    end 
    
    def self.new_from_filename(filename)
      song_array = filename.split(" - ")
      song_array[1] = song_array[1].chomp(".mp3") #chomp is used to remove the character at the end of strings (in this case, .mp3)
      song = self.new
      song.name = song_array[1]
      song.artist_name = song_array[0]
      song
  end
  
    def self.create_from_filename(filename)
      result = filename.split(" - ")
      song = self.create 
      song.name = result.name 
      song.artist_name = result.artist_name
      self.all << song 
      song
  end
end
