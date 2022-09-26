require_relative 'dictionary'

class Braille < Dictionary
    attr_reader :grid

    def initialize
        @grid = Array.new
        super
    end    

    def print_english(incoming_file_path, outgoing_file_path)
        line_count = 0
        File.readlines(incoming_file_path).each do |line|
            if line_count != 0 && line_count % 3 == 0                
                grid.transpose.each do |character|
                    english_char = translate_braille(character.join.scan(/.{1,2}/).join("\n"))
                    File.write(outgoing_file_path, english_char, mode: 'a')
                end
                @grid = Array.new
                @grid.push(line.strip.chars.each_slice(2).to_a)
                line_count = 1
            else 
                # require 'pry'; binding.pry
                line_count += 1
                @grid.push(line.strip.chars.each_slice(2).to_a)
            end            
        end
        grid.transpose.each do |character|
            english_char = translate_braille(character.join.scan(/.{1,2}/).join("\n"))
            File.write(outgoing_file_path, english_char, mode: 'a')
        end
    end

    def add_english_character(character, file_path)
        if grid.length < 40
            grid.push(character_array(character))
        elsif grid.length % 40 == 0
            print_braille(file_path)
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

    def add_braille_character(incoming_file_path, outgoing_file_path)
        
    end
end