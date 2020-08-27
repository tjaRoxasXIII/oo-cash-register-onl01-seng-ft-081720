require 'pry'

class CashRegister

    attr_accessor :total, :discount, :title, :price, :cart, :item_prices

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @item_prices = []
    end

    def items
        @cart
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price * quantity
        @total += @price
        @cart << @title
        @item_prices << @price
        if quantity > 1
            while quantity > 1 
                @cart << @title
                @item_prices << @price
                quantity -= 1
            end
        end
    end

    def apply_discount
        @total = @total * (1 - (discount * 0.01))
        if discount == 0 || discount == nil
            return "There is no discount to apply."
        else
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @total = @total - @item_prices[-1]
    end
end