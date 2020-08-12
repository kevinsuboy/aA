require_relative "./board"

class AiPlayer
    def initialize(board_obj, name = "Governator")
        @name = name
        @grid = Array.new(board_obj.size){Array.new(board_obj.size)}
        @guessed_pos_hash = Hash.new{|hash,key| hash[key] = Hash.new}
        @pos_pairs = board_obj.get_pos_pairs # [[0,0],[0,1],[0,2]...]
        @set = board_obj.set
    end
    def get_input
        p "#{@name}, enter a position to guess"
        #if anything in guess_pos_has has "set" number and none are solved
        @guessed_pos_hash.each do |face_value,inner_hash|
            # sleep 1
            # p "-------------#{inner_hash.keys.length} ----------------"
            # sleep 1
            if inner_hash.keys.length == @set # num of pos for a face_value == set
                pos = inner_hash.keys.sample
                loop do
                    pos = inner_hash.keys.sample
                    break if !inner_hash[pos]
                end
                return pos
                # inner_hash.each do |pos,solved|
                #     if !solved
                #         return pos
                #     end
                # end
            end
        end
        pos = @pos_pairs.sample
        @pos_pairs.delete(pos)
        return pos
    end
    def get_feedback(pos, face_value, solved)
        @grid[pos[0]][pos[1]] = [face_value, solved]
        if solved
            @guessed_pos_hash.delete(face_value)
        else
            @guessed_pos_hash[face_value][pos] = solved
        end
    end
end


if __FILE__ == $PROGRAM_NAME
    h = HumanPlayer.new
    p h.get_input
end