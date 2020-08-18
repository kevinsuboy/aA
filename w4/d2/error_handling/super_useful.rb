# PHASE 2
def convert_to_int(str)
  Integer(str)
  rescue ArgumentError => e
    puts "You're a dum dum. Arg needs to be '0..9' str"
    puts "Message was: #{e.message}"
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin # anything from here to rescue MAY throw an error
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError => e
    puts "error was: #{e.message}"
    if maybe_fruit == "coffee"
      puts "Thanks for the coffee, i want fruit"
      retry
    else
      puts "RAAWWWRRRR, IMMA EAT YOU NOW"
    end
  ensure
    puts "BYE BYE"
  end
end  

# PHASE 4
class UnfriendlyError < StandardError; end
class NoNameError < StandardError; end
class NoPastimeError < StandardError; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise UnfriendlyError.new("You're not my friend") if yrs_known < 5
    raise NoNameError.new("You have no name") if name.length < 1
    raise NoPastimeError.new("You have no pastime") if fav_pastime.length < 1
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


