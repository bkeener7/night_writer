require_relative 'dictionary'

class Braille < Dictionary
    attr_reader :grid

    def initialize
        @grid = Array.new
        super
    end    

    def print_english(incoming_file_path, outgoing_file_path)
        add_braille(incoming_file_path)
        grid.transpose.each do |character|
            english_char = translate_braille(character.flatten.join.scan(/.{1,2}/).join("\n"))
            File.write(outgoing_file_path, english_char, mode: 'a')
        end
    end

    def add_english(character, file_path)
        if grid.length < 40
            grid.push(character_array(character))
        elsif grid.length % 40 == 0
            print_braille(file_path)
            File.write(file_path, "\n", mode: 'a') 
            @grid = Array.new
            grid.push(character_array(character))
        else 
            :error
        end
    end

    def print_braille(file_path)
        grid.transpose.each do |lines|
            lines.each do|line|
                File.write(file_path, "#{line}", mode: 'a')
            end
            File.write(file_path, "\n", mode: 'a') 
        end
    end

    def add_braille(incoming_file_path)
        File.readlines(incoming_file_path).each do |line|
            @grid.push(line.strip.chars.each_slice(2).to_a)
        end
    end
end