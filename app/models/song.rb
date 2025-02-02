class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre
  has_many :notes
accepts_nested_attributes_for :notes, :reject_if => proc { |attrs| attrs[:content].blank? }

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name 
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre = Genre.find_by(id: id )
  end

  def genre_id 
    self.genre ? self.genre.id : nil
  end

  def note_ids=(id)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

  def note_id 
    self.notes ? self.notes.id : nil
  end
 
  
end
