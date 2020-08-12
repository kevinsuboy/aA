class Card
# A Card has two useful bits of information: its face value, and whether it is face-up or face-down. You'll want instance variables to keep track of this information. You'll also want a method to display information about the card: nothing when face-down, or its value when face-up. I also wrote #hide, #reveal, #to_s, and #== methods.

# Common problem: Having issues with #hide and #reveal? Try testing small.


# face value, Class variable dictionary
# game
#     IMG = choose_symbol
#     new_card = Card.new(IMG)
#     new_card_pair = Card.new(IMG)

# end



    # @@DICTIONARY = {}
    attr_reader :face_value, :solved
    def initialize(face_value)
        @face_value = face_value
        @face_up = false
        @solved = false
    end
    # def self.dictionary
    #     @@DICTIONARY
    # end

    def self.choose_symbol(game_dictionary)
        # loop do
        while true
            c = (("a".."z").to_a.concat(("A".."Z").to_a).concat((0..9).to_a.map!{|el|el.to_s})).sample
            break unless game_dictionary[c]
        end
        game_dictionary[c] = true
        c
    end
    def display
        # debugger
        (@face_up||@solved) ? @face_value : "."
    end
    def hide
        @face_up = false
    end
    def reveal
        @face_up = true
    end
    def to_s # to solved
        @solved = true
    end
    def ==(card_obj)
        @face_value == card_obj.face_value
    end

end

if __FILE__ == $PROGRAM_NAME
    game_dictionary = {}
    img = Card.choose_symbol(game_dictionary)
    # p Card.dictionary
    p c = Card.new(img)
    p c_comp = Card.new(img)
    #
    c.display
    c_comp.display
    c.reveal
    c_comp.reveal
    c.display
    c_comp.display
end