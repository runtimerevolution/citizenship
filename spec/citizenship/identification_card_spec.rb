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

  it 'covers control digit collision flaw' do
    #see http://dokatano.blogspot.pt/2008/10/o-mistrio-do-bilhete-de-identidade.html
    expect(Citizenship.valid_identification_card?('6617080', 0)).to be_true
  end
end