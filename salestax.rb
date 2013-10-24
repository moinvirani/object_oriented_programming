=begin
- Sales tax is 10% on all goods 
- Exeptions: books, food and medical products
- Import duty is additional 5% with no exemptions

When purchasing item, receipt lists:
- name of all items
- Price(incl tax) 
- total cost of item
- tax paid

Formula for rounding salestax:
p = (np/100) rounded up to nearest 0.05 sales tax
=end

=begin 
Attributes on receipt:
- name of item
- total quantity
- price
- tax exemptions
- is it imported
=end


#Input 1

	class ShoppingBasket 
		attr_accessor :quantity, :name, :price

		def initialize(quantity, name, price)
			@quantity = quantity
			@name = name
			@price = price
		end
	end

	basket1 = ShoppingBasket.new(1, "Book", 12.99)
	basket2 = ShoppingBasket.new(1, "CD", 14.99)
	basket3 = ShoppingBasket.new(1, "Chocolate bar", 0.85)


	

	puts "#{basket1.quantity} - #{basket1.name} - #{basket1.price}"
	puts "#{basket2.quantity} - #{basket2.name} - #{basket2.price}"
	puts "#{basket3.quantity} - #{basket3.name} - #{basket3.price}"


	

