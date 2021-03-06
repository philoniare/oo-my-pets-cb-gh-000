class Owner
  attr_reader :species
  attr_accessor :pets, :name
  ALL = []
  def initialize(species)
    @pets = {fishes: [], cats: [], dogs: []}
    @species = species
    ALL << self
  end
  def self.all
    ALL
  end
  def self.reset_all
    ALL.clear
  end
  def say_species
    "I am a #{species}."
  end
  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end
  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end
  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end
  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = 'happy'}
  end
  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = 'happy'}
  end
  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = 'happy'}
  end
  def sell_pets
    @pets.each{ |pet_type, pets|
      pets.each{ |pet|
        pet.mood = 'nervous'
      }
    }
    @pets.clear
  end
  def list_pets
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end
  def self.count
    ALL.size
  end
end
