class Braille

    #full grid is 40 braille characters. 80 wide, and 3 tall
    def full_grid
        Array.new(3) { Array.new(80) { nil } }
    end

    #one braille character is 2 wide and 3 tall
    def braille_character
        Array.new(3) { Array.new(2) { nil } }
    end
end