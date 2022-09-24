class Braille
    attr_reader :grid

    #full grid is 40 braille characters. 80 wide, and 3 tall
    #one braille character is 2 wide and 3 tall

    def initialize
        @grid = Array.new(40) { Array.new(3) { Array.new(2) { nil } } }
    end

    def print_character(character)
        braille_character(character).each { |char_line| puts char_line }
    end
end