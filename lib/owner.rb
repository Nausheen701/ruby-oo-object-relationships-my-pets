class Owner

  attr_accessor 
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self} 
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self} 
  end

  def buy_cat(name)
    #create a new cat
    #use name as the first argument
    #use self as owner
    #add an instance from the cat class to this method
    Cat.new(name, self)
  end

  def buy_dog(name)
   Dog.new(name, self)
  end

  def walk_dogs #(name)
    #access all the dogs owned by the owner
    #change the mood of each dog to happy
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|cat| cat.mood = "nervous"}
    self.dogs.each {|dog| dog.owner = nil}
    self.cats.each {|cat| cat.owner = nil}
  end

  def list_pets
    self.dogs.count
    self.cats.count
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

