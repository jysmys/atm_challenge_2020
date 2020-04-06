class Account
    STANDARD_VALIDITY_YRS = 5
    attr_accessor :exp_date, :pin_code, :account_status, :balance
    def initialize
        @exp_date = set_expire_date
        @pin_code = generate_pin
        @account_status
        @balance
    end

    def set_expire_date
        Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def generate_pin
        rand(10000..19999).to_s[1,4]
    end
end