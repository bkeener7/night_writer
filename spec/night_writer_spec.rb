require_relative 'spec_helper'

RSpec.describe NightWriter do
        let(:nightwriter) {NightWriter.new}
    
    it '1. exists' do
        expect(nightwriter).to be_an_instance_of(NightWriter)
    end

    it '2. can read user input and print to terminal' do
        allow(nightwriter).to receive(:created_file).and_return('braille.txt')
        expect(nightwriter.startup_message).to eq("Created 'braille.txt' containing 86 characters")
    end
end