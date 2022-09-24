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

end