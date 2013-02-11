describe 'NIF validation' do
  it 'passes for valid NIFs' do
    expect(Citizenship.valid_nif?('123456789')).to be_true
    expect(Citizenship.valid_nif!('123456789')).to eq('123456789')
  end

  it 'fails on invalid NIFs' do
    expect(Citizenship.valid_nif?('223456789')).to be_false
    expect(Citizenship.valid_nif?('12345678')).to be_false
    expect { Citizenship.valid_nif!('223456789') }.to raise_error(Citizenship::Error)
    expect(Citizenship.valid_nif?(nil)).to be_false
  end
end