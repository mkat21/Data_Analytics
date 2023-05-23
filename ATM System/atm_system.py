# Define the classes
class Person:
    def __init__(self, name, pin, bank_card):
        self.name = name
        self.pin = pin
        self.bank_card = bank_card

    def withdraw(self, amount):
        # Check the withdrawal limit
        if amount > 50000:
            print("Withdrawal amount exceeded limit")
        else:
            # Dispense cash from ATM
            atm.dispense(amount)
    
    def deposit(self, amount):
        # Deposit cash to bank account
        bank.update_balance(amount)
    
    def change_pin(self, new_pin):
        self.pin = new_pin
        print("PIN changed successfully")

    def check_balance(self):
        # Verify the PIN and display the balance
        if bank.verify_pin(self.bank_card, self.pin):
            print("Your balance is:", bank.get_balance(self.bank_card))

    def request_cheque_book(self):
        # Request a cheque book from the bank
        bank.request_cheque_book(self.bank_card)

    def use_bank_card(self, bank_card):
        # Use a debit card from another bank
        atm.use_bank_card(bank_card)

class ATM:
    def __init__(self, cash):
        self.cash = cash
        self.num_transactions = 0
    
    def dispense(self, amount):
        if self.num_transactions >= 5:
            print("Transaction limit exceeded")
        elif amount > self.cash:
            print("ATM out of cash")
        else:
            # Dispense the cash
            self.cash -= amount
            self.num_transactions += 1
            print("Please collect your cash")

    def use_bank_card(self, bank_card):
        # Use a debit card from another bank
        bank.verify_pin(bank_card, None)
        print("Welcome to our ATM")

class Bank:
    def __init__(self, name, balance):
        self.name = name
        self.balance = balance
        self.customers = {}

    def verify_pin(self, bank_card, pin):
        # Verify the PIN of the customer
        if bank_card in self.customers and (pin is None or self.customers[bank_card] == pin):
            return True
        else:
            print("Invalid PIN")
            return False

    def update_balance(self, amount):
        # Update the balance of the account
        self.balance += amount
        print("Deposit successful. Your balance is:", self.balance)

    def get_balance(self, bank_card):
        # Get the balance of the account
        return self.balance

    def request_cheque_book(self, bank_card):
        # Request a cheque book for the account
        print("Cheque book requested. It will be delivered soon.")

# Create objects
bank = Bank("XYZ Bank", 1000000)
person = Person("John", 1234, "1234-5678-9012-3456")
atm = ATM(50000)

# Interact with the ATM system
person.withdraw(20000)  # Withdraw 20,000
person.withdraw(60000)  # Withdraw 60,000 (exceeds limit)
person.deposit(10000)   # Deposit 10,000
person.check_balance()  # Check balance
person.request_cheque_book()  # Request cheque book
person.use_bank_card("5678-9012-3456")  # Use debit card from another bank
person.change_pin(4321)  # Change PIN
