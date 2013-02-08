describe 'identification card validation' do
  it 'passes on valid identification card numbers' do
    expect(Citizenship.valid_identification_card?('156 944 8', '8')).to be_true
    expect { Citizenship.valid_identification_card!('156 944 8', '8') }.not_to raise_error
  end

  it 'fails on invalid identification card numbers' do
    expect(Citizenship.valid_identification_card?('156 944 8', '7')).to be_false
    expect { Citizenship.valid_identification_card!('156 944 8', '7') }.to raise_error(Citizenship::Error)
    expect { Citizenship.valid_identification_card!('', '0') }.to raise_error(Citizenship::Error)
    expect { Citizenship.valid_identification_card?(nil, '0') }.to raise_error(ArgumentError)
  end
end