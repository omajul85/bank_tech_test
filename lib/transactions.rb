require "./lib/transaction"

class Transactions

	attr_reader :transaction, :all

  include Enumerable

  def initialize(transaction = Transaction)
    @all = []
    @transaction = transaction
  end

  def each(&block)
    all.each(&block)
  end

  def deposit(date, credit, balance)
    all << transaction.new(date: date, credit: credit, balance: balance)
  end

  def withdraw(date, debit, balance)
    all << transaction.new(date: date, debit: debit, balance: balance)
  end

  def reverse
  	all.reverse
  end

end