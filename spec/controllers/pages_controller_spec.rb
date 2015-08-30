require 'rails_helper'
require 'pages_controller.rb'

RSpec.describe PagesController, type: :controller do
  describe '#parse_response' do
    it 'correctly formats a dictionary api response' do
      hash = {:term=>"nonsense", :entries=>[{:id_attribute=>"nonsense", :head_word=>"non*sense", :pronunciation=>"ˈnɑ:nˌsɛns", :part_of_speech=>"noun", :sound=>"nonsen01.wav", :word=>"nonsense", :id=>1, :definitions=>[{:sense_number=>"1", :text=>":words or ideas that are foolish or untrue", :verbal_illustration=>"I don't know why you believe that nonsense about certain numbers being unlucky.", :cross_reference=>[]}, {:sense_number=>"2", :text=>":behavior that is silly, annoying, or unkind    see also no-nonsense", :verbal_illustration=>"He was not in the mood to put up with any nonsense from his little brother.", :cross_reference=>[]}, {:sense_number=>"3", :text=>":language that has no meaning   often used before another noun", :verbal_illustration=>"Many of the words in the poem are nonsense.", :cross_reference=>[]}], :inflections=>[]}, {:id_attribute=>"no-nonsense", :head_word=>"no–nonsense", :pronunciation=>nil, :part_of_speech=>"adjective", :sound=>nil, :word=>"no-nonsense", :id=>1, :definitions=>[{:sense_number=>"0", :text=>":very serious about doing things in a direct and efficient way without any foolishness or nonsense", :verbal_illustration=>"I want to wear something that will make me look like a no-nonsense professional.", :cross_reference=>[]}], :inflections=>[]}], :suggestions=>[]}

      expect(controller.parse_response(hash)).to eq("\"nonsense\":\n1. words or ideas that are foolish or untrue.\n2. behavior that is silly, annoying, or unkind (see also no-nonsense).\n3. language that has no meaning (often used before another noun).\n\n\"no-nonsense\":\n1. very serious about doing things in a direct and efficient way without any foolishness or nonsense.\n\n")
    end
  end
end