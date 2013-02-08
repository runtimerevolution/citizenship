describe 'identification card validation' do
  it 'passes on valid identification card numbers' do
    expect(Citizenship.identification_card_check('156 944 8', '8')).to be_true
    expect { Citizenship.identification_card_check!('156 944 8', '8') }.not_to raise_error
  end

  it 'fails on invalid citizen card numbers' do
    expect(Citizenship.identification_card_check('156 944 8', '7')).to be_false
    expect { Citizenship.identification_card_check!('156 944 8', '7') }.to raise_error(Citizenship::Error)
    expect { Citizenship.identification_card_check!('', '0') }.to raise_error(Citizenship::Error)
    expect { Citizenship.identification_card_check!(nil, '0') }.to raise_error(ArgumentError)
  end
end