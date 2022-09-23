require_relative 'spec_helper'

RSpec.describe NightWriter do
    let(:nightwriter) {NightWriter.new}
    let(:file_like_object) { double('file like object') }
         
    it '1. exists' do
        expect(nightwriter).to be_an_instance_of(NightWriter)
    end

    it '2. can read user input and print to terminal' do
        allow(nightwriter).to receive(:created_file).and_return('braille.txt')
        allow(nightwriter).to receive(:character_length).and_return('86')
        expect(nightwriter.startup_message).to eq "Created 'braille.txt' containing 86 characters"
    end

    it '3. can create files' do
        allow(nightwriter).to receive(:created_file).and_return('braille.txt')
        allow(File).to receive(:open).with('braille.txt', 'w+').and_return(file_like_object)
        expect(nightwriter.create_file).to eq file_like_object
    end

    it '4. can read files' do
        allow(nightwriter).to receive(:existing_file).and_return('dummy_message.txt')
        expect(nightwriter.read_file).to eq 'This is a test file for night_writer implementation. This file contains 86 characters.'
    end

    it '5. can determine length of file' do
        allow(nightwriter).to receive(:created_file).and_return('dummy_message.txt')
        expect(nightwriter.character_length).to eq 86
    end
end