describe 'Email validation' do
  it 'passes on valid emails' do
    expect(Citizenship.valid_email?('user@example.org')).to be_truthy
  end

  it 'falid on invalid emails' do
    expect {Citizenship.valid_email!(' user@example.org')}.to raise_error(Citizenship::EmailError)
    expect(Citizenship.valid_email?('user@example.org ')).to be_falsy
    expect(Citizenship.valid_email?('email@')).to be_falsy
    expect(Citizenship.valid_email?('@example.com')).to be_falsy
  end
end
