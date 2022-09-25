require_relative 'spec_helper'

RSpec.describe NightWriter do
    let(:nightwriter) {NightWriter.new}
         
    it '1. exists' do
        expect(nightwriter).to be_an_instance_of(NightWriter)
    end

    it '2. can read user input and print to terminal' do
        allow(nightwriter).to receive(:created_filepath).and_return('braille.txt')
        allow(nightwriter).to receive(:character_length).and_return('86')
        expect(nightwriter.startup_message).to eq "Created 'braille.txt' containing 86 characters"
    end

    it '3. can read files' do
        expect(nightwriter.read_file('./dummy_files/dummy_message.txt')).to eq 'This is a test file for night_writer implementation. This file contains 86 characters.'
    end

     it '4. can determine length of file' do
        allow(nightwriter).to receive(:created_filepath).and_return('./dummy_files/dummy_message.txt')
        expect(nightwriter.character_length).to eq 86
    end

    it '5. can create and write to files' do
        expect(File.exists?('./dummy_files/dummy_braille.txt')).to be false
        nightwriter.write_file('./dummy_files/dummy_braille.txt', './dummy_files/dummy_message.txt')
        expect(File.exists?('./dummy_files/dummy_braille.txt')).to be true

        expect(nightwriter.read_file('./dummy_files/dummy_braille.txt')).to eq 'This is a test file for night_writer implementation. This file contains 86 characters.'
        
        File.delete('./dummy_files/dummy_braille.txt')
        expect(File.exists?('./dummy_files/dummy_braille.txt')).to be false
    end

    it '6. can translate files to braille' do
        allow(nightwriter).to receive(:existing_filepath).and_return('./dummy_files/dummy_translate.txt')
        allow(nightwriter).to receive(:created_filepath).and_return('./dummy_files/dummy_write.txt')
        expected = "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n................................................................................\n................................................................................\n\n0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n........................................\n........................................\n"
        
        expect(File.read('./dummy_files/dummy_write.txt')).to eq ""
        nightwriter.translate_file

        expect(File.read('./dummy_files/dummy_write.txt')).to eq expected
        File.open('./dummy_files/dummy_write.txt', 'w+')
        expect(File.read('./dummy_files/dummy_write.txt')).to eq ""   
    end
end