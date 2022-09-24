require_relative 'spec_helper'

RSpec.describe Braille do
    let(:braille) {Braille.new}
    let(:dictionary) {Dictionary.new}

    it '1. exists' do
        expect(braille).to be_an_instance_of(Braille)

    end

    it '2. holds an array for a 80 character line of braille' do
        expected = [[[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]],
        [[nil, nil], [nil, nil], [nil, nil]]]
        expect(braille.grid).to eq expected
    end

    xit '4. can hold a braille character' do
        expect(braille_character("h").to eq [["0", "."], ["0", "0"], [".", "."]])
    end

end