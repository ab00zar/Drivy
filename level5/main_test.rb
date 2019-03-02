require 'json'
describe 'A simple output test' do
  it 'check if the output and expected one are the same' do
    f1 = JSON.parse(File.read('data/expected_output.json'))
    f2 = JSON.parse(File.read('data/output.json'))

    expect(f1["rentals"]).to eq(f2["rentals"])
  end
end
