require "pry"

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count # counts how many elements are in the array
  end

  def self.reset_all
    self.all.clear # clears the array
  end

  def cats
    Cat.all.select {|cat| cat.owner == self} # returns a list of all the cats that belong to the owner
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self} # returns a list of all the dogs that belong to the owner
  end

  def buy_cat(name)
    Cat.new(name, self) # buy a cat pass through its name and self would be the new owner being passed through
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}

  end

  def sell_pets


    pets = self.dogs + self.cats
    pets.each do |pet| # to update both attributes you have to do a do |block|
      pet.mood = "nervous" #a one line return only returns one things so you need to use a do |block|
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end