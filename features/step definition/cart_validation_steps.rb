
Given /^I go to ([a-zA-Z_.]+)$/ do |site|
	@home_page = HomePage.new(@browser, site)
end

And /^I (signup|signin)$/ do |action|
	if action == "signin"
		@home_page.click_signin
		@home_page.existing_user_signin(EMAIL,PASSWORD)
		@home_page.close_like_form
	else
		email = generate_unique_email
		@home_page.enter_your_email(email)
		@home_page.click_signup
		@home_page.create_password(PASSWORD)
		@home_page.type_first_name(FIRST_NAME)
		@home_page.type_last_name(LAST_NAME)
		@home_page.confirm
		#@home_page.error_displayed?.should be_false      #enable this if you want some error validation
		@home_page.signup_modal_displayed?.should be_true
		@home_page.signup_heading.should == "Welcome to LimeRoad!"
	end
end

When /^I search for television$/ do
	@home_page.input_search "television"
	@home_page.submit
end

Then /^I get the result$/ do
	@home_page.title.should include "Television"
end


Given /^I go to sales page$/ do
	@home_page.close_the_modal if @home_page.modal_displayed?
	@sale_page = @home_page.click_sale
end

Given /^I select ([a-zA-Z_]+) product$/ do |product|
	@input_product = []
	product_to_add = PRODUCTS[product]
	@sale_page.select_product(product_to_add)
	@input_product.push(product_to_add)
end

And /^I add multiple products to cart$/ do |table|
	@input_product = []
	table.raw.each do |item|
		product_to_add = PRODUCTS[item[0]]
		@sale_page.select_product(product_to_add)
		@sale_page.add_to_cart
		@sale_page.close_the_modal
		@input_product.push(product_to_add)
	end
	puts @input_product 
end

Then /^my cart should have all the items$/ do
	@sale_page.open_cart
	@sale_page.read_cart.should_not be_empty   # likewise we can add more checks here
end

When /^I add the item to cart$/ do
	@sale_page.add_to_cart
end

Then /^my cart should have the item$/ do
	cart_items = @sale_page.read_cart 
	cart_items.should_not be_empty
	@sale_page.close_the_modal		#additional steps to see cart is persistant
	@sale_page.open_cart
	cart = @sale_page.read_cart
	cart.should_not be_empty
	cart["product"].join(",").should include @input_product.join(",")     #maching input and cart products
end
