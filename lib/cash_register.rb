require 'pry'
class CashRegister
    attr_accessor :total, :discount, :item, :last
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @item = []
        @last = 0
    end

    def add_item(title, price, quantity=1)
        self.total=(self.total+=(price*quantity))
        # self.item = []
        # binding.pry
        testing = ("#{title} "*quantity).split(" ")
        self.item << testing
        self.last = price*quantity
        # binding.pry
        # p self
    end

    def apply_discount
        if self.discount > 0
        self.total=(self.total*(1-(self.discount.to_f/100)))
        "After the discount, the total comes to $#{self.total.to_i}."
        else
        "There is no discount to apply."
        end
    end

    def items
        self.item.flatten
        # binding.pry
    end

    def void_last_transaction
                    self.total=(self.total-self.last)
    end

test1 = CashRegister.new(20)
test1.add_item("thing", 1000, 2)
test1.void_last_transaction
p test1.total

end 