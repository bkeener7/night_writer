require_relative 'spec_helper'

RSpec.describe Dictionary do
  let(:dictionary) { Dictionary.new }

  it '1. exists' do
    expect(dictionary).to be_an_instance_of(Dictionary)
  end

  it '2. can translate letters to braille' do
    expect(dictionary.translate[:b]).to eq "0.\n0.\n.."
  end

  it '3. includes entire translation' do
    expect(dictionary.translate).to eq({
                                         a: "0.\n..\n..",
                                         b: "0.\n0.\n..",
                                         c: "00\n..\n..",
                                         d: "00\n.0\n..",
                                         e: "0.\n.0\n..",
                                         f: "00\n0.\n..",
                                         g: "00\n00\n..",
                                         h: "0.\n00\n..",
                                         i: ".0\n0.\n..",
                                         j: ".0\n00\n..",
                                         k: "0.\n..\n0.",
                                         l: "0.\n0.\n0.",
                                         m: "00\n..\n0.",
                                         n: "00\n.0\n0.",
                                         o: "0.\n.0\n0.",
                                         p: "00\n0.\n0.",
                                         q: "00\n00\n0.",
                                         r: "0.\n00\n0.",
                                         s: ".0\n0.\n0.",
                                         t: ".0\n00\n0.",
                                         u: "0.\n..\n00",
                                         v: "0.\n0.\n00",
                                         w: ".0\n00\n.0",
                                         x: "00\n..\n00",
                                         y: "00\n.0\n00",
                                         z: "0.\n.0\n00",
                                         " ": "..\n..\n.."
                                       })
  end

  it '4. can convert letters to braille array' do
    expect(dictionary.character_array(:k)).to eq ['0.', '..', '0.']
  end

  it '5. can convert letters back to english' do
    expect(dictionary.translate_braille("00\n0.\n0.")).to eq 'p'
  end
end
