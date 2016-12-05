require "spec_helper"

describe Orghunter do
  Orghunter.configure do |config|
    config.api_key = ENV['ORGHUNTER_API_KEY']
  end

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

  describe 'Orghunter.basic_info' do
    describe 'When making a valid query' do
      VCR.use_cassette('basic_info_with_results') do
        charity_info = Orghunter.basic_info('261688229')

        it "returns a single charity" do
          expect(charity_info).to be_kind_of Orghunter::Charity
        end

        it 'returns the charity with the correct ein' do
          expect(charity_info.ein).to eq('261688229')
        end

        it 'returns the charity with the correct name' do
          expect(charity_info.name).to eq("KIDS COWS AND MORE INC")
        end

        it 'returns a charity with the basic information provided by OrgHunter' do
          expect(charity_info.in_care_of).to eq("MARK HALL")
          expect(charity_info.city).to eq('HOUSTON')
          expect(charity_info.filing_requirement_code_desc).to eq("Not required to file (income less than $25,000)")
        end 

      end
    end

    describe "When querying for something with no results" do
      VCR.use_cassette('basic_info_no_results') do
        no_charity_info = Orghunter.basic_info('99999999')
        it 'returns a string notifying lack of results' do
          expect(no_charity_info).to eq('No results for ein: 99999999')
        end
      end
    end
  end

end
