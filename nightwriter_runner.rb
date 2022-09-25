require './lib/night_writer'

nightwriter = NightWriter.new(ARGV[0], ARGV[1])
nightwriter.start
