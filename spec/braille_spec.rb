require_relative 'spec_helper'

RSpec.describe Braille do
    let(:braille) {Braille.new}
    
    it '1. exists' do
        expect(braille).to be_an_instance_of(Braille)
    end

    # xit '2. holds an array for a 80 character line of braille' do
    #     expected = [[[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]],
    #     [[nil], [nil], [nil]]]
    #     expect(braille.grid).to eq expected
    # end

    it '3. can print a single braille character' do
        allow(braille).to receive(:puts).and_return(double().as_null_object)
        expect(braille.print_character(:h)).to eq ([["0."], ["00"], [".."]])
    end

    it '4. can add a braille character to the grid' do
        braille.add_character(:h)
        expect(braille.grid[0]).to eq([["0."], ["00"], [".."]])
    end

    it '5. can print braille characters in correct vertical and horizontal order' do
        allow(braille).to receive(:print).and_return(double().as_null_object)
        expected = [[["0."], ["00"], [".."]], [["0."], [".0"], [".."]], [["0."], ["0."], ["0."]], [["0."], ["0."], ["0."]], [["0."], [".0"], ["0."]]]
        expected_print = [["0.", "0.", "0.", "0.", "0."], ["00", ".0", "0.", "0.", ".0"], ["..", "..", "0.", "0.", "0."]]
        braille.add_character(:h)
        braille.add_character(:e)
        braille.add_character(:l)
        braille.add_character(:l)
        braille.add_character(:o)
        expect(braille.grid.length).to eq 5
        expect(braille.grid).to eq(expected)
        expect(braille.print_grid).to eq(expected_print)
    end

end