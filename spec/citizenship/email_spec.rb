describe 'Email validation' do
  it 'passes on valid emails' do
    expect(Citizenship.valid_email?('user@example.org')).to be_true
  end

  it 'falid on invalid emails' do
    expect {Citizenship.valid_email!(' user@example.org')}.to raise_error(Citizenship::EmailError)
    expect(Citizenship.valid_email?('user@example.org ')).to be_false
    expect(Citizenship.valid_email?('email@')).to be_false
    expect(Citizenship.valid_email?('@example.com')).to be_false
  end
end