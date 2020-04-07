require './lib/person'
require './lib/atm'

describe Person do
    subject { described_class.new(name: 'Steffe') }

    it 'is expected to have a :name on initilize' do
        expect(subject.name).not_to be nil
    end

    it 'is expected to raise an error if no name is set' do
        expect { described_class.new }.to raise_error 'A name is required'
    end

    it 'is expected to have a :cash attribute with the value of 0 on init' do
        expect(subject.cash).to eq 0
    end

    it 'is expected to have a :account attribute' do
        expect(subject.account).to be nil
    end

    describe 'can create an Account' do
        before { subject.create_account }
        it 'of Account class' do
            expect(subject.account).to be_an_instance_of Account
        end

        it 'with himself as an owner' do
            expect(subject.account.owner).to be subject
        end
    end
















    
end