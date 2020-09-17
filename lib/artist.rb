require 'pry'
class Artist
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def Artist.all
        @@all
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def Artist.find_or_create_by_name(name)
        
        if self.all.find{|artist| artist.name == name} == nil
            Artist.new(name)
        else
            self.all.find{|artist| artist.name == name}
        end
    end

    def print_songs
         self.songs.each do |song|
            puts song.name 
         end
    end




end