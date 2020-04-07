require 'date'
class Account
    STANDARD_VALIDITY_YRS = 5
    attr_accessor :exp_date, :pin_code, :account_status, :balance, :owner
    def initialize(attrs = {})
        @exp_date = set_expire_date
        @pin_code = generate_pin
        @account_status = :active
        @balance = 0
       # @owner = attrs[:owner] = nil ? missing_owner : attrs[:owner]
        set_owner(attrs[:owner])
    end

    def set_expire_date
        Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def generate_pin
        rand(10000..19999).to_s[1,4]
    end
    
    def deactivate
        @account_status = :deactivate
    end

    private
    def set_owner(obj)
        obj == nil ? missing_owner : @owner = obj
    end

    def missing_owner
        raise "An Account owner is required"
    end
end