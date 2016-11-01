require "spec_helper"

describe Orghunter::Search do
  let(:options){
    {
     rows:    22,
     start:   1
    }
  }
  # user_key:     string    required    Your API Key
  # ein:          number    optional    Employer Identification Number (EIN)
  # searchTerm:   string    optional    Charity Name or Keyword. Example: "humane society" or "cancer"
  # city:         string    optional    city name. Example: "Miami"
  # state:        string    optional    state name - Two letter state abbreviation
  # zipCode:      string    optional    zipcode value - 5 digit zipcode value
  # category:     string    optional    Category Value Selected from Categories API
  # eligible:     string    optional    eligible=1 will return only organizations that are tax deductible and in good standing with the IRS
  # rows:         number    optional    Records Per Page. Default Value = 20
  # start:        number    optional    Record Set Start Position

  let(:search){Orghunter::Search.new('cows', options)}
  let(:search_results){search.results}

  it 'should exist' do
    expect(search).to be_kind_of(Orghunter::Search)
  end

  it "Has an Array of Charities" do
    expect(search.results).to be_kind_of(Array)
    search.results.each{|charity| expect(charity).to be_kind_of(Orghunter::Charity)}
  end

  it "Has a count of the results" do
    expect(search.count).to eq(22)
  end

  it "Has a record start position" do
    expect(search.start_position).to eq(1)
  end

  it "Has an ending position" do
    expect(search.final_position).to eq(23)
  end

  it "Has a number of rows returned" do
    expect(search.rows_returned).to eq(22)
  end

end