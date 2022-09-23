require_relative 'spec_helper'

RSpec.describe Braille do

    it '1. exists' do
        braille_text = Braille.new
        expect(braille_text).to be_an_instance_of(Braille)
    end

end