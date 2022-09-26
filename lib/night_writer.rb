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

    def start_nightwriter
        translate_to_braille
        puts startup_message
    end

    def start_nightreader
        translate_to_english
        puts startup_message
    end
    
    def character_length
        File.read("#{created_filepath}").length
    end

    def startup_message
        "Created '#{created_filepath}' containing #{character_length} characters"
    end
    
    def translate_to_braille
        File.open(created_filepath, 'w+')
        input_text = File.read(existing_filepath).chars
        input_text.map do |char|
            braille.read_english(char.to_sym, created_filepath)
        end
        braille.print_braille_translation(created_filepath)
        File.truncate(created_filepath, File.size(created_filepath) - 1)
    end

    def translate_to_english
        File.open(created_filepath, 'w+')
        braille.read_braille(existing_filepath, created_filepath)
    end
end