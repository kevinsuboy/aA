require_relative "Piece.rb"
require 'singleton'

class NullPiece < Piece
    include Singleton # is this enuff?
    def initialize
        @symbol = "."
        # @symbol = "_|"
        @color = :none
    end
    def moves
        []
    end
end
                                            