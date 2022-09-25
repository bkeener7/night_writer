require_relative 'spec_helper'

RSpec.describe Braille do
    let(:braille) {Braille.new}
    
    it '1. exists' do
        expect(braille).to be_an_instance_of(Braille)
    end

    it '2. can add a braille character to the grid' do
        braille.add_character(:h, './dummy_files/dummy_write.txt')
        expect(braille.grid).to eq([["0.", "00", ".."]])
    end

   it '3. can print braille characters in correct vertical and horizontal order' do
        allow(braille).to receive(:print).and_return(double().as_null_object)
        expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]
        expected_print = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]]
        braille.add_character(:h, './dummy_files/dummy_write.txt')
        braille.add_character(:e, './dummy_files/dummy_write.txt')
        braille.add_character(:l, './dummy_files/dummy_write.txt')
        braille.add_character(:l, './dummy_files/dummy_write.txt')
        braille.add_character(:o, './dummy_files/dummy_write.txt')
        expect(braille.grid.length).to eq 5
        expect(braille.grid).to eq(expected)
        expect(braille.print_grid('./dummy_files/dummy_write.txt')).to eq(expected_print)
    end

    it '4. will only allow 40 braille characters in a grid' do
        allow(braille).to receive(:print).and_return(double().as_null_object)
        41.times { braille.add_character(:a, './dummy_files/dummy_write.txt') }
        expect(braille.grid).to eq([["0.", "..", ".."]])

        File.open('./dummy_files/dummy_write.txt', 'w+')
        expect(File.read('./dummy_files/dummy_write.txt')).to eq "" 
    end

    it '5. can write to file' do
        braille.add_character(:a, './dummy_files/dummy_write.txt')
        braille.add_character(:a, './dummy_files/dummy_write.txt')
        braille.add_character(:a, './dummy_files/dummy_write.txt')
        braille.add_character(:a, './dummy_files/dummy_write.txt')
        braille.add_character(:a, './dummy_files/dummy_write.txt')
        braille.print_grid('./dummy_files/dummy_write.txt')

        expect(File.read('./dummy_files/dummy_write.txt')).to eq "0.0.0.0.0.\n..........\n..........\n"

        File.open('./dummy_files/dummy_write.txt', 'w+')
        expect(File.read('./dummy_files/dummy_write.txt')).to eq ""     
    end

    it '6. can translate back to english' do

    end
end