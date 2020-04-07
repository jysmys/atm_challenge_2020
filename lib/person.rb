require_relative 'account.rb'
class Person

    attr_accessor :name, :cash, :account
    def initialize(attrs = {})
        @name = set_name(attrs[:name])
        @cash = 0
        @account
    end

    def create_account
        @account = @account.nil? ? Account.new(self) : @account
    end

    def deposit
    end
    def set_name(name)
        if name.nil?
            raise 'A name is required'
        end
        @name = name
    end

end