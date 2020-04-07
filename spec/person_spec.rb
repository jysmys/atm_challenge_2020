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

    describe 'can manage funds if an account has been created' do
        let(:atm) { Atm.new }
        #can put cash into account
        before { subject.create_account }
        it 'can deposit funds' do
            expect(subject.deposit(100)).to be_truthy
        end

        it 'money are added to the account balance - deducted from cash when depositing' do
            subject.cash = 100
            subject.deposit(100)
            expect(subject.account.balance).to be 100
            expect(subject.cash).to be 0
        end

        it 'can withdraw funds' do
            subject.account.balance = 100
            expect(subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account, atm: atm)).to be_truthy
        end

        it 'withdraw is expected to to raise an error if no ATM is passed in' do
            expect{subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account)}.to raise_error 'An ATM is required'
        end


        it 'withdraw is expected to to raise an error if person does not have enough money' do
            subject.account.balance = 50
            expect{subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account, atm: atm)}.to raise_error 'insufficient funds'
        end

        it 'funds are added to cash, and deducted from account balance' do
            subject.cash = 100
            subject.deposit(100)
            subject.withdraw(amount: 100, pin: subject.account.pin_code, account: subject.account, atm: atm)
            expect(subject.account.balance).to be 0
            expect(subject.cash).to be 100
        end
    end

    describe 'can not manage funds if no account has been created' do
        #Cannot depo without account
        it 'cannot deposit funds' do
            expect {subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
        end
        it 'cannot withdraw funds' do
            #needs atm obj
        end 
    end

end