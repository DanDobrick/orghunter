require "spec_helper"

describe Orghunter do
  it "has a version number" do
    expect(Orghunter::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

describe Orghunter::Charity do 
  args = {ein: "261688229",
    charityName: "KIDS COWS AND MORE INC",
    category: "Arts, Culture and Humanities",
    url: "http://www.orghunter.com/organization/261688229",
    donationUrl: "http://donate.makemydonation.org/donate/261688229",
    eligibleCd: 1,
    city: "HOUSTON",
    state: "Texas",
    zipCode: "77018-8305",
    deductibilityCd: 1,
    statusCd: 1,
    start: 0,
    rows: 20,
    recordCount: 85,
    score: 13.815885,
    website: "http://www.kidscowsandmore.org/",
    missionStatement: "Kids AND cows!",
    acceptingDonations: 1}
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
    expect(charity.OrgHunter_URL).to eq("http://www.orghunter.com/organization/261688229")
  end

  it "Has readable donation_URL" do
    expect(charity.donation_URL).to eq("http://donate.makemydonation.org/donate/261688229")
  end

  it "Has readable elegible_Cd" do
    expect(charity.elegible_Cd).to eq("1")
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
    expect(charity.website_url).to eq("http://www.kidscowsandmore.org/")
  end

  it "Has a mission statement" do
    expect(charity.mission).to eq("Kids AND cows!")
  end

  it "Returns true or false to accepting donations" do
    expect(charity.accepting_donations?).to eq('true')
  end

end

# describe Orghunter::Search do
#   let(:results){Orghunter::Search.new}

#   it "Returns an Array of Charities" do
    # end
#   Use part of the search results to get he number of records and start and stop. It's given in EACH charity for some reason.
# end
