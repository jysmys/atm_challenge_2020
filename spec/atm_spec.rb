require './lib/atm.rb'
require 'date'
describe Atm do
    let(:account) {instance_double('Account')}

    before do 
        #before test, add attr balance to account
        allow(account).to receive(:balance).and_return(100)
        #Also allow to set balance with method
        allow(account).to receive(:balance=)
    end

    it 'allow withdrawal if the account has enough balance' do
        #fix more later
        expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
        #check that happy path works
        expect(subject.withdraw(45,account)).to eq expected_output
    end

    it 'rejects withdrawal if account has insuffient funds' do
        expected_output = { status: false, message: 'insufficient funds', date: Date.today}
        expect(subject.withdraw(105, account)).to eq expected_output
    end

    it 'has €1000 on initialize' do
        expect(subject.funds).to eq 1000
    end
    it 'funds are reduced at withdraw' do
        subject.withdraw(50,account)
        expect(subject.funds).to eq 950
    end

    it 'reject withdraw if ATM has insufficient funds' do
        subject.funds = 50
        expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
        expect(subject.withdraw(100, account)).to eq expected_output
    end
end
