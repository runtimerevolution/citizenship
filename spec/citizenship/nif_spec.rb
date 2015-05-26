describe 'NIF validation' do
  it 'passes for valid NIFs' do
    expect(Citizenship.valid_nif?('123456789')).to be_truthy
    expect(Citizenship.valid_nif!('123456789')).to eq('123456789')
    expect(Citizenship.valid_nif!('123456789')).to eq('123456789')
  end

  it 'fails on invalid NIFs' do
    expect(Citizenship.valid_nif?('223456789')).to be_falsy
    expect(Citizenship.valid_nif?('12345678')).to be_falsy
    expect { Citizenship.valid_nif!('223456789') }.to raise_error(Citizenship::Error)
    expect(Citizenship.valid_nif?(nil)).to be_falsy
  end

  it 'strict validation disallow whitspaces and others' do
    expect(Citizenship.valid_nif?(' 123456789', strict: true)).to be_falsy
    expect(Citizenship.valid_nif?('123456789 ', strict: true)).to be_falsy
    expect(Citizenship.valid_nif?('12345 6789', strict: true)).to be_falsy
    expect(Citizenship.valid_nif?('123456789', strict: true)).to be_truthy
  end
end
