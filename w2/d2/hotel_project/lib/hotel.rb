require_relative "room"

class Hotel

    attr_reader :rooms
    
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new()
        hash.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end
    
    def name
        temp = @name.split # ["hello", "world"]
        new = []
        temp.each do |word|
            new << word.capitalize
        end
        return new.join(" ")
    end

    def room_exists?(name)
       return @rooms.has_key?(name)
    end
    
    def check_in(person, room)
        if !self.room_exists?(room)
            p "sorry, room does not exist"
        else   
          # @rooms is a hash
          # room as a key
          # @rooms[room] -> Room obj
            if @rooms[room].add_occupant(person)
                p "check in successful"
            else   
                p "sorry room is full"
            end
        end
    end

    def has_vacancy?
        # Room#full?
        return !@rooms.all? {|room_name,room_obj| room_obj.full?}
    end

    def list_rooms
        # Room#available_space
        @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
    end

end


