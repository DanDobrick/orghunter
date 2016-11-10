require "spec_helper"

describe Orghunter::Charity do 
  Orghunter.configure do |config|
    config.api_key = ENV['ORGHUNTER_API_KEY']
  end
  
  args = {"ein" => "261688229",
    "charityName" => "KIDS COWS AND MORE INC",
    "category" => "Arts, Culture and Humanities",
    "url" => "http://www.orghunter.com/organization/261688229",
    "donationUrl" => "http://donate.makemydonation.org/donate/261688229",
    "eligibleCd" => 1,
    "city" => "HOUSTON",
    "state" => "Texas",
    "zipCode" => "77018-8305",
    "deductibilityCd" => 1,
    "statusCd" => 1,
    "start" => 0,
    "rows" => 20,
    "recordCount" => 85,
    "score" => 13.815885,
    "website" => "http://www.kidscowsandmore.org/",
    "missionStatement" => "Kids AND cows!",
    "acceptingDonations" => 1}
  let(:charity){Orghunter::Charity.new(args)}

  it "should exist" do
    expect(charity).to be_kind_of(Orghunter::Charity)
  end

  it "Has readable name" do
    expect(charity.name).to eq("KIDS COWS AND MORE INC")
  end

  it "Has readable category" do
    expect(charity.category).to eq("Arts, Culture and Humanities")
  end

  it "Has readable OrgHunter URL" do
    expect(charity.org_hunter_URL).to eq("http://www.orghunter.com/organization/261688229")
  end

  it "Has readable donation_URL" do
    expect(charity.donation_URL).to eq("http://donate.makemydonation.org/donate/261688229")
  end

  it "Has readable eligibility" do
    expect(charity.eligible?).to eq(true)
  end

  it "Has a readable city" do
    expect(charity.city).to eq("HOUSTON")
  end

  it "Has a readable State" do
    expect(charity.state).to eq("Texas")
  end

  it "Has a readable Zipcode" do
    expect(charity.zip_code).to eq("77018-8305")
  end

  it "Has readable deductibility" do
    expect(charity.deductable?).to eq(true)
  end

  it "Has a readable status" do
    expect(charity.status).to eq(1)
  end

  it "Has a search score" do
    expect(charity.search_score).to eq(13.815885)
  end

  it "Has a website" do 
    expect(charity.website).to eq("http://www.kidscowsandmore.org/")
  end

  it "Has a mission statement" do
    expect(charity.mission).to eq("Kids AND cows!")
  end

  it "Returns true or false to accepting donations" do
    expect(charity.accepting_donations?).to eq(true)
  end

  describe "When getting basic_info on charity" do
    VCR.use_cassette('basic_info_with_results') do
      basic_info = Orghunter.basic_info(261688229)
      it 'returns more information than the basic results' do
            expect(basic_info.in_care_of).to eq('MARK HALL')
            expect(basic_info.street).to eq('415 W 30TH ST')
            expect(basic_info.country).to eq('USA')
            expect(basic_info.subsection).to eq('501(c)(3)')
            expect(basic_info.classification).to eq("Charitable Organization")
            expect(basic_info.affiliation).to eq("Independent - This code is used if the organization is an independent organization or an independent auxiliary (i.e., not affiliated with a National, Regional, or Geographic grouping of organizations).")
            expect(basic_info.rulling_date).to eq('October, 2008')
            expect(basic_info.deductibility).to eq("Contributions are deductible.")
            expect(basic_info.deductibility_status).to eq('PC')
            expect(basic_info.foundation).to eq("Organization which receives a substantial part of its support from a governmental unit or the general public   170(b)(1)(A)(vi)")
            expect(basic_info.organization).to eq("Corporation")
            expect(basic_info.exempt_status).to eq("Unconditional Exemption")
            expect(basic_info.tax_period).to eq("December, 2014")
            expect(basic_info.asset_code_desc).to eq("500,000 to 999,999")
            expect(basic_info.income_code_desc).to eq("10,000 to 24,999")
            expect(basic_info.filing_requirement_code_desc).to eq("Not required to file (income less than $25,000)")
            expect(basic_info.pf_filing_requirement).to eq("No PF return")
            expect(basic_info.accounting_period).to eq("December")
            expect(basic_info.asset_amount).to eq("570877.00")
            expect(basic_info.income_amount).to eq("10874.00")
            expect(basic_info.form990).to eq("10874.00")
            expect(basic_info.ntee_cd).to eq('A52')
            expect(basic_info.ntee_class).to eq("Children's Museums")
            expect(basic_info.ntee_type).to eq("Arts, Culture and Humanities")
            expect(basic_info.accepting_donation).to eq(true)
          end
        end
  end


end