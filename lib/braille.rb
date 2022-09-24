require_relative 'dictionary'

class Braille < Dictionary
    attr_reader :grid

    #full grid is 40 braille characters. 80 wide, and 3 tall
    #one braille character is 2 wide and 3 tall
    def initialize
        # @grid = Array.new(40) { Array.new(3) { Array.new(1) { nil } } }
        @grid = Array.new
        super
    end

    def print_grid
        vertical_alignment = grid.flatten.each_slice(3).to_a.transpose
        vertical_alignment.each do |lines|
            lines.each { |line| print line }
            print "\n"
        end
    end

    def print_character(character)
        character_array(character).each { |char_line| puts char_line }
    end

    def add_character(character)
        if grid.length < 40
            grid.push(character_array(character))
        else 
            :error
        end
    end
end