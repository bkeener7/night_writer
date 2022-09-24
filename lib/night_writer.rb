existing_file = ARGV[0]
created_file = ARGV[1]
character_length = File.read('../message.txt').length

puts "Created '#{ARGV[1]}' containing #{character_length} characters"
