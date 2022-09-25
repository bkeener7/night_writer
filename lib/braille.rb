require_relative 'dictionary'

class Braille < Dictionary
    attr_reader :grid

    def initialize
        @grid = Array.new
        super
    end

    def print_grid(file_path)
        vertical_alignment = grid.flatten.each_slice(3).to_a.transpose
        vertical_alignment.each do |lines|
            lines.each do|line|
                File.write(file_path, "#{line}", mode: 'a')
            end
            File.write(file_path, "\n", mode: 'a') 
        end
    end

    def print_character(character)
        character_array(character).each { |char_line| puts char_line }
    end

    def add_character(character, file_path)
        if grid.length < 40
            grid.push(character_array(character))
        elsif grid.length % 40 == 0
            print_grid(file_path)
            File.write(file_path, "\n", mode: 'a') 
            @grid = Array.new
            grid.push(character_array(character))
        else 
            :error
        end
    end
end