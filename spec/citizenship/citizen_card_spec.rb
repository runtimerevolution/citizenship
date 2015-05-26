describe 'citizen card validation' do
  it 'passes on valid citizen card numbers' do
    cc_number = '00000000 0 ZZ 4'

    expect(Citizenship.valid_citizen_card?(cc_number)).to be_truthy
    expect(Citizenship.valid_citizen_card!(cc_number)).to eq(cc_number)
    expect(Citizenship.valid_citizen_card!('00000000-0-ZZ-4')).to eq('00000000-0-ZZ-4')
    expect(Citizenship.valid_citizen_card!('00000000.0.ZZ.4')).to eq('00000000.0.ZZ.4')
  end

  it 'fails on invalid citizen card numbers' do
    expect(Citizenship.valid_citizen_card?('')).to be_falsy
    expect { Citizenship.valid_citizen_card!(nil) }.to raise_error(Citizenship::Error)
    expect { Citizenship.valid_citizen_card!('12345678 9 ZZ8') }.to raise_error(Citizenship::Error)
  end
end
