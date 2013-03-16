describe 'phone number validation' do
  context 'passes for valid phone numbers' do
    it 'land lines' do
      expect(Citizenship.valid_phone!('262-999-666')).to eq('262-999-666')
    end

    it 'mobile' do
      expect(Citizenship.valid_phone!('939332233')).to eq('939332233')
      expect(Citizenship.valid_phone!('969332233')).to eq('969332233')
      expect(Citizenship.valid_phone!('929332233')).to eq('929332233')
      expect(Citizenship.valid_phone?('919332233')).to be_true
    end

    it 'with country prefix' do
      expect(Citizenship.valid_phone!('+351 93 933 2233')).to eq('+351 93 933 2233')

    end

    it 'without countryprefix' do
      expect(Citizenship.valid_phone?('+351 93 933 2233', allow_country_prefix: false)).to be_false
    end

    it 'by designated prefix', focus: true do
      expect(Citizenship.valid_phone!('+351 93 933 2233', only_prefixes: ['93', '96'])).to eq('+351 93 933 2233')
      expect(Citizenship.valid_phone!('+351 96 933 2233', only_prefixes: ['93', '96'])).to eq('+351 96 933 2233')
    end

    it 'strict validation disallow whitspaces, dashes and dots' do
      expect(Citizenship.valid_phone?('262999666', strict: true)).to be_true
    end
  end

  context 'fails for invalid phone numbers' do
    it 'land lines' do
      expect { Citizenship.valid_phone!('662-999-666') }.to raise_error(Citizenship::Error)
    end

    it 'mobile' do
      expect(Citizenship.valid_phone?('999332233')).to be_false
    end

    it 'with country prefix' do
      expect(Citizenship.valid_phone?('+350 93 933 2233')).to be_false
    end

    it 'by designated prefix' do
      expect(Citizenship.valid_phone?('96 933 2233', only_prefixes: '93')).to be_false
      expect(Citizenship.valid_phone?('96 933 2233', only_prefixes: ['91', '93'])).to be_false
    end


    it 'strict validation disallow whitspaces, dashes and dots' do
      expect(Citizenship.valid_phone?('262-999-666', strict: true)).to be_false
      expect(Citizenship.valid_phone?('262 999 666', strict: true)).to be_false
      expect(Citizenship.valid_phone?(' 262999666', strict: true)).to be_false
      expect(Citizenship.valid_phone?(' 262999666 ', strict: true)).to be_false
    end
  end
end