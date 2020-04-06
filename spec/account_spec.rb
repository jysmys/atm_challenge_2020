require './lib/account.rb'
describe Account do
    let(:person) {instance_double('Person', name: 'Steffe')}
    subject {described_class.new({owner: person})}

    it 'is expected to have an owner and ' do
        expect(subject.owner).to eq person
    end

    it 'is expected to raise an error if no owner is set and ' do
        expect {described_class.new }.to raise_error 'An Account owner is required'
    end

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