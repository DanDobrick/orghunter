require "spec_helper"
describe Orghunter::configuration do
  it 'has an API key' do
    expect(Orghunter.configuration.api_key).to eq(ENV["ORGHUNTER_API_KEY"])
  end
end