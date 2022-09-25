require './lib/night_writer'

nightreader = NightWriter.new(ARGV[0], ARGV[1])
nightreader.start
