describe 'NIB validation' do
  it 'passes for valid NIBs', focus: true do
    nib = '003503730000539151280'

    expect(Citizenship.valid_nib!(nib)).to eq(nib)
    expect(Citizenship.valid_nib?(nib)).to be_true
  end

  it 'fails for invalid NIBs' do
    nib = '003503730000539151200'

    expect{ Citizenship.valid_nib!(nib) }.to raise_error(Citizenship::Error)
    expect(Citizenship.valid_nib?(nib)).to be_false
    expect(Citizenship.valid_nib?('')).to be_false
  end
end