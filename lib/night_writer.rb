#ruby ./lib/night_writer.rb message.txt braille.txt
require_relative 'braille'

class NightWriter
    attr_reader :existing_filepath,
                :created_filepath,
                :braille

    def initialize(existing_filepath, created_filepath)
        @existing_filepath = existing_filepath
        @created_filepath = created_filepath
        @braille = Braille.new
    end

    def start
        translate_file
        puts startup_message
    end
    
    def character_length
        File.read("#{created_filepath}").length
    end

    def startup_message
        "Created '#{created_filepath}' containing #{character_length} characters"
    end

    def read_file(file_path)
        File.read(file_path)
    end

    def write_file(writing_filepath, reading_filepath)
        output_file = File.open(writing_filepath, 'w+')
        output_file.write(read_file(reading_filepath))
        output_file.close
    end
    
    def translate_file
        input_text = File.read(existing_filepath).chars
        input_text.map do |char|
            braille.add_character(char.to_sym, created_filepath)
        end
        braille.print_grid(created_filepath)        
    end
end