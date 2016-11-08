require "spec_helper"

describe Orghunter::Category do
  let(:category){Orghunter::Category.new( {'categoryid' => 'A','categoryDesc' => "Arts, Culture and Humanities"} )}

  it 'should exist' do
    expect(category).to be_kind_of(Orghunter::Category)
  end

  it 'has readable category_id' do
    expect(category.category_id).to eq('A')
  end

  it 'has readable description' do
    expect(category.description).to eq('Arts, Culture and Humanities')
  end

end