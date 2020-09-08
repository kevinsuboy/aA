class Dog
  def self.all
    @@dogs ||= []
  end
  
  def initialize(name)
    @name = name
    
    self.class.all << self
  end
end

class Corgi < Dog

end

if __FILE__ == $PROGRAM_NAME
    d1 = Dog.new("Fido")
    d2 = Dog.new("Fido 2.0")

    p Dog.all
    c1 = Corgi.new("Jambalaya")
    p Dog.all
    p Corgi.all
end