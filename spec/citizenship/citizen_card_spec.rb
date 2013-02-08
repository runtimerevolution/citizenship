describe 'citizen card validation' do
  it 'passes on valid citizen card numbers' do
    cc_number = '00000000 0 ZZ 4'

    expect(Citizenship.valid_citizen_card?(cc_number)).to be_true
    expect { Citizenship.valid_citizen_card!(cc_number) }.not_to raise_error
  end

  it 'fails on invalid citizen card numbers' do
    expect(Citizenship.valid_citizen_card?('')).to be_false
    expect { Citizenship.valid_citizen_card?(nil) }.to raise_error(ArgumentError)
    expect { Citizenship.valid_citizen_card!('12345678 9 ZZ8') }.to raise_error(Citizenship::Error)
  end
end