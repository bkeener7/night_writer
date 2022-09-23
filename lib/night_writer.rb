#ruby ./lib/night_writer.rb message.txt braille.txt
class NightWriter
    attr_reader :existing_file,
                :created_file,
                :character_length,
                :create_file

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

    def create_file
        File.open("#{created_file}", 'w+')
    end

    def read_file
        File.open("#{existing_file}", 'r').read
    end

end