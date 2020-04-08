require_relative 'account.rb'
class Person

    attr_accessor :name, :cash, :account
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account = nil
    end

    def create_account
        @account = Account.new(owner: self)
    end

    
    def set_name(name)
        if name.nil?
            raise 'A name is required'
        end
        @name = name
    end

    def deposit(amount)
        @account.nil? ? (raise 'No account present') : deposit_account(amount)
    end

    def withdraw(attr)
        attr[:atm].nil? ? (raise RuntimeError, 'An ATM is required') : attr[:atm]
        @account.nil? ? (raise RuntimeError, 'Person has no account') : @account
        withdraw_account(attr)
    end

    private

    def deposit_account(amount)
        @account.balance += amount
        @cash -= amount
    end

    def withdraw_account(attr)
        receipt = attr[:atm].withdraw(attr[:amount],@account.pin_code,@account)
        receipt[:status] == true ? @cash += attr[:amount] : (raise receipt[:message])
    end

end