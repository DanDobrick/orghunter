require "spec_helper"

describe Orghunter::Search do
  let(:term_search){ Orghunter::Search.new( {search_term: 'cows',rows: 22, start: 1} ) }
  let(:term_search_results){term_search.results}
  let(:ein_search){ Orghunter::Search.new({ein: 261688229}) }
  let(:city_search){ Orghunter::Search.new({city: 'Chicago'}) }
  let(:state_search){ Orghunter::Search.new({city: 'IL'}) }
  let(:zip_code_search){ Orghunter::Search.new({city: '60606'}) }
  # let(:category_search){ Orghunter::Search.new({city: 'Chicago'}) }
  let(:eligible_search){ Orghunter::Search.new({eligible: true}) }


  it 'should exist' do
    expect(term_search).to be_kind_of(Orghunter::Search)
  end

  it "Has an Array of Charities" do
    expect(term_search.results).to be_kind_of(Array)
    search.results.each{|charity| expect(charity).to be_kind_of(Orghunter::Charity)}
  end

  it "Has a count of the results" do
    expect(term_search.count).to eq(22)
  end

  it "Has a record start position" do
    expect(term_search.start_position).to eq(1)
  end

  it "Has an ending position" do
    expect(term_search.final_position).to eq(23)
  end

  it "Has a number of rows returned" do
    expect(term_search.rows_returned).to eq(22)
  end

  it "Returns one charity when searching by EIN" do
    expect(ein_search.results).to have(1).charity
  end

  it "Returns the charity with a particular EIN when searching by ein" do
    returned_charity = ein_search.results[0]
    expect(returned_charity).to be_kind_of(Orghunter::Charity)
    expect(returned_charity.ein).to eq(261688229)
  end

  it "returns results with the same city if searching for a city`" do
    city_search.results.each {|charity| expect(charity.city).to eq('Chicago')}
  end

  it "returns results with the same state if searching for a state`" do
    state_search.results.each {|charity| expect(charity.state).to eq('IL')}
  end 

  it "returns results with the same zip_code if searching for a zip_code`" do
    zip_code_search.results.each {|charity| expect(charity.zip_code).to eq('Chicago')}
  end

  it "returns results with the same eligibility if searching for a eligibility`" do
    elegibility_search.results.each {|charity| expect(charity.elegibile?).to eq(true)}
  end


end