require_relative "Piece.rb"
require 'singleton'

class NullPiece < Piece
    include Singleton # is this enuff?
end
                        