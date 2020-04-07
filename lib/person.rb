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

    def deposit(amount)
        if @account.nil?
            raise 'No account present'
        else
            @account.balance += amount
            @cash -= amount
        end 
    end

    def set_name(name)
        if name.nil?
            raise 'A name is required'
        end
        @name = name
    end

end