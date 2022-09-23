#ruby ./lib/night_writer.rb message.txt braille.txt
class NightWriter

    def initialize 
        @existing_filepath = ARGV[0]
        @created_filepath = ARGV[1]
    end

    # def self.terminal_welcome
    #     merge with startup message?
    # end
    
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
end