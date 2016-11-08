require "spec_helper"

describe Orghunter do
  it "has a version number" do
    expect(Orghunter::VERSION).not_to be nil
  end

  describe 'Orghunter.all_categories' do
      it 'returns an array' do
        VCR.use_cassette('categories') do
          expect(Orghunter.all_categories).to be_kind_of(Array)
        end
      end

      it 'each item in the array is a category object' do
        VCR.use_cassette('categories') do
          all_categories = Orghunter.all_categories
          all_categories.each{|category| expect(category).to be_kind_of(Orghunter::Category)}
        end
      end
  end
end
