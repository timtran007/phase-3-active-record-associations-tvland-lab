require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    
    self.characters.map do |character, show|
        "#{character.name} - #{shows.find(character.show_id).name}"
    end
  end

end