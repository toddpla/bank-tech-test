# bank-tech-test

## approach
The challenge was to build a bank account application. Bank accounts must be able to accept deposits and withdrawals and print a bank statement.

I chose to build the application with a double entry ledger at its core. Here all transactions have a debit and credit value and the account balance is calculated when a new transaction is initialised. This approach means that transactions cannot be updated or deleted once they are added to the ledger. Another option would have been to make write a dynamic balance method on the transaction or account class however I felt that should an account acquire a large number of transactions processing the balance dynamically could be an expensive use of processing power. I believe in this instance the fact the records cannot be updated or deleted is a positive factor increasing data integrity and the application the will be able to scale more easily with less processing required by using a static balance attribute over a balance method.

## setup

```sh
git clone https://github.com/toddpla/bank-tech-test.git
cd bank-tech-test
bundle
```

## testing
```sh
rspec
```
coverage 100%
![test-coverage](https://www.github.com/toddpla/docs/images/test_coverage.png)

## example usage
open using pry or irb
```sh
$ require './lib/account'
=> true
$ require './lib/transaction'

=> true
$ account = Account.new(Transaction)
=> #<Account:0x00007fbd2a0acff0 @ledger=[], @trans_class=Transaction>
$ account.deposit(125.00)
=> #<Transaction:0x00007fbd2a942f20
 @balance=125.0,
 @credit=125.0,
 @date=#<Date: 2018-12-04 ((2458457j,0s,0n),+0s,2299161j)>,
 @debit=nil>
$ account.withdrawal(35.50)
=> #<Transaction:0x00007fbd2a1bf4b0
 @balance=89.5,
 @credit=nil,
 @date=#<Date: 2018-12-04 ((2458457j,0s,0n),+0s,2299161j)>,
 @debit=35.5>
$ account.deposit(20.00)
=> #<Transaction:0x00007fbd2b0cd9e8
 @balance=109.5,
 @credit=20.0,
 @date=#<Date: 2018-12-04 ((2458457j,0s,0n),+0s,2299161j)>,
 @debit=nil>
$ account.statement
=> "date || credit || debit || balance\n04/12/2018 || 20.00 || || 109.50\n04/12/2018 || || 35.50 || 89.50\n04/12/2018 || 12
5.00 || || 125.00"
```
