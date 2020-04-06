require './lib/account.rb'
require './lib/atm.rb'
describe Account do
    
    it 'is expected to have :active status on initialize' do
        expect(subject.account_status).to eq :active
    end

    it 'check the length of a number' do
        number = 1234
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
    end

    it 'has an expiry date on init' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end

    it 'deactivate account using the instance method' do
        subject.deactivate
        expect(subject.account_status).to eq :deactivate
    end
end