require_relative 'dictionary'

class Braille < Dictionary
  attr_reader :grid

  def initialize
    @grid = []
    super
  end

  def read_braille(incoming_file_path, outgoing_file_path)
    line_count = 0
    File.readlines(incoming_file_path).each do |line|
      grid.push(line.strip.chars.each_slice(2).to_a)
      if line_count == 2
        print_english_translation(outgoing_file_path)
        @grid = []
        line_count = 0
      else
        line_count += 1
      end
    end
  end

  def print_english_translation(outgoing_file_path)
    grid.transpose.each do |character|
      english_char = translate_braille(character.join.scan(/.{1,2}/).join("\n"))
      File.write(outgoing_file_path, english_char, mode: 'a')
    end
  end

  def read_english(character, file_path)
    if grid.length < 40
    else
      print_braille_translation(file_path)
      @grid = []
    end
    grid.push(character_array(character))
  end

  def print_braille_translation(file_path)
    grid.transpose.each do |lines|
      lines.each do |line|
        File.write(file_path, line.to_s, mode: 'a')
      end
      File.write(file_path, "\n", mode: 'a')
    end
  end
end
