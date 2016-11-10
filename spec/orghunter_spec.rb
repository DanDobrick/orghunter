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

        it 'returns more information than the basic results' do
          expect(charity_info.in_care_of).to eq('MARK HALL')
          expect(charity_info.street).to eq('415 W 30TH ST')
          expect(charity_info.country).to eq('USA')
          expect(charity_info.subsection).to eq('501(c)(3)')
          expect(charity_info.classification).to eq("Charitable Organization")
          expect(charity_info.affiliation).to eq("Independent - This code is used if the organization is an independent organization or an independent auxiliary (i.e., not affiliated with a National, Regional, or Geographic grouping of organizations).")
          expect(charity_info.rulling_date).to eq('October, 2008')
          expect(charity_info.deductibility).to eq("Contributions are deductible.")
          expect(charity_info.deductibility_status).to eq('PC')
          expect(charity_info.foundation).to eq("Organization which receives a substantial part of its support from a governmental unit or the general public   170(b)(1)(A)(vi)")
          expect(charity_info.organization).to eq("Corporation")
          expect(charity_info.exempt_status).to eq("Unconditional Exemption")
          expect(charity_info.tax_period).to eq("December, 2014")
          expect(charity_info.asset_code_desc).to eq("500,000 to 999,999")
          expect(charity_info.income_code_desc).to eq("10,000 to 24,999")
          expect(charity_info.filing_requirement_code_desc).to eq("Not required to file (income less than $25,000)")
          expect(charity_info.pf_filing_requirement).to eq("No PF return")
          expect(charity_info.accounting_period).to eq("December")
          expect(charity_info.asset_amount).to eq("570877.00")
          expect(charity_info.income_amount).to eq("10874.00")
          expect(charity_info.form990).to eq("10874.00")
          expect(charity_info.ntee_cd).to eq('A52')
          expect(charity_info.ntee_class).to eq("Children's Museums")
          expect(charity_info.ntee_type).to eq("Arts, Culture and Humanities")
          expect(charity_info.accepting_donation).to eq(true)
        end

      end
    end

    describe "When querying for something with no results" do
      VCR.use_cassette('basic_info_no_results') do
        xit 'returns something' do
        end
      end
    end
  end

end
