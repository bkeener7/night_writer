class NightWriter
    attr_reader :existing_file,
                :created_file,
                :character_length
                
    def initialize 
        @existing_file = ARGV[0]
        @created_file = ARGV[1]
        @character_length = File.read('./message.txt').length
    end

    def startup_message
        "Created '#{created_file}' containing #{character_length} characters"
    end
end