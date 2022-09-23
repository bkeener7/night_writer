#ruby ./lib/night_writer.rb message.txt braille.txt
class NightWriter
    attr_reader :existing_file

    def initialize 
        @existing_file = ARGV[0]
        @created_file = ARGV[1]
    end

    def character_length
        File.read("#{created_file}").length
    end

    def startup_message
        "Created '#{created_file}' containing #{character_length} characters"
    end

    def read_file(input_file)
        File.read(input_file)
    end

    def write_file(writing_file, reading_file)
        output_file = File.open(writing_file, 'w+')
        output_file.write(read_file(reading_file))
        output_file.close
    end
end