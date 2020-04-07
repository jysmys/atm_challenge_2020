


describe Person do 



























    

    describe 'can manage funds if an account has been created' do
        let(:atm) { Atm.new }
        #can put cash into account
        before { subject.create_account }
        it 'can deposit funds' do
            expect(subject.deposit(100)).to be_truthy
        end
    end

    describe 'can not manage funds if no account has been created' do
        #Cannot depo without account
        it 'cannot deposit funds' do
            expect {subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
        end
    end
end