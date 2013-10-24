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





	class Product 
		attr_accessor(:quantity, :name, :price)

		def initialize(quantity, name, price)
			@quantity = quantity
			@name = name
			@price = price
		end

		# def quantity 
		# 	@quantity
		# end

		# def quantity=(quantity)
		# 	@quantity = quantity
		# end


		def tax_rate
			0.10
		end

		def subtotal
			@quantity * @price 
		end

		def sales_tax	
			subtotal * tax_rate
		end

		def total_price
			subtotal + sales_tax
		end
	end

	class Exempt < Product
		def tax_rate
			0
		end
	end

	class Imported  < Product
		def tax_rate
			super + 0.05  #super is a word that says run the parent 
		end
	end

	class ImportedExempt < Exempt
		def tax_rate
			super + 0.05
		end
	end



# Doing the calculations

	class Receipt
		attr_accessor :products

		def initialize(*products)  	# * is called a splat operator
			@products = products
		end

		def salestax_cal
			# Refactor
			sales_tax_total = 0
			@products.each do |p|    # makes a loop (enumerable look up), look up "map" 
				sales_tax_total += p.sales_tax # sales_tax_total = sales_tax_total + p.sales_tax
			end
			return sales_tax_total
		end

		def total
			# Refactor
			total = 0
			@products.each do |p|
				total += p.total_price
			end
			return total
		end

		def print_totals
			@products.each do |p| 
				puts "#{p.quantity} #{p.name} : #{p.price}"
			end

			puts "Sales Taxes: #{sprintf('%.2f', salestax_cal)}"
			puts "Total: #{sprintf('%.2f', total)}"
		end
	end

# Regular Products

	cd = Product.new(1, "CD", 14.99)
	perfume = Product.new(1, "Perfume", 20.89)

# Tax Exempt
	book = Exempt.new(1, "Book", 12.49)
	chocolate = Exempt.new(1, "Chocolate bar", 0.85)
	headache_pills = Exempt.new(1, "Headache pills", 9.75)
	
# Imported

	imported_chocolates = ImportedExempt.new(1, "Imported Chocolate", 10.50)
	imported_perfume = Imported.new(1, "Imported Perfume", 54.65)

# Printing the Order outputs 

	order1 = Receipt.new(book, cd, chocolate)
	order2 = Receipt.new(imported_chocolates, imported_perfume)
	order3 = Receipt.new(imported_perfume, perfume, headache_pills, imported_chocolates)
	puts order1.print_totals
	puts order2.print_totals
	puts order3.print_totals





