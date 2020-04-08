# atm_challenge_2020
---
By Jenny https://github.com/jysmys/ <br>
& Marcus https://github.com/ViaMarcus
---
## The code:
A simple ATM simulator implementing 3 different classes:
<ul>

- The ATM class itself

- A person

- The account of the person

The ATM is initiated with 1000 units of an arbitrary currency. It holds this value in magical bills of 5, 10 and 20. There are infinite bills of each kind despite the total amount of money being limited.

The person is initiated with a name.
He has 0 cash on initiation. 

The account is created by having the person invoke its create_account function. 

The account is initiated with a random pin code and 0 funds.

Dependencies:
RSpec is needed to run the tests available in ./spec/.

Setup:
Clone repo.
Run bundler to install gems.

Instructions:
Load all 3 classes available in ./lib/ to your interactive ruby console. Initiate a person by using Person.new(name: \<name>).
Give the person an account by person.create_account.
Create an ATM by using Atm.new.
The person can now interact with the ATM using the withdraw method. Read source code for more info :).

Updates/improvment plans:
* Limit deposit values to discrete values that are the possible combinations of the bills.

* Limit bills in machine to reflect value in machine.

* Keep track of what bills the person has to further limit the deposit values

* These will never happen

#### Licensed under MIT license