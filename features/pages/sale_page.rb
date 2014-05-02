class SalePage
	$wait_for_element= Selenium::WebDriver::Wait.new(:timeout => 20)
	def initialize(browser)
		@browser = browser
		@browser.manage.timeouts.implicit_wait = 10
    	raise('Exception: Sales page is not opening') unless @browser.title.include? "Online Sale for Women Clothing & Accessories"
    end

    def select_product(product)
    	product_image = "div.products div.product_image div[name='#{product}'] img"
    	$wait_for_element.until{@browser.find_element(:css,product_image).displayed?}
    	@browser.find_element(:css,product_image).click
    end

    def add_to_cart
    	add_button = "div.product-overlay-wrapper div#productDetails li#add_to_cart_li a.addtocart_btn"
    	$wait_for_element.until{@browser.find_element(:css,add_button).displayed?}
    	@browser.find_element(:css,add_button).click
    end

    def read_cart
    	cart = Hash.new
    	products = []
    	$wait_for_element.until{@browser.find_element(:css,"div#shopping_cart").displayed?}
    	cart_items = @browser.find_elements(:css,"div#shopping_cart div#cart_items li")
    	cart_items.each do |item |
    		product = item.find_element(:css,"img.cart_img").attribute("alt")
    		products.push(product)
    	end
    	price = @browser.find_element(:css,"div.cart_items_footer div.order").text.split("\n")
    	cart["product"] = products
    	cart["total"] = price
    	cart
    end	

    def close_the_modal
		$wait_for_element.until{@browser.find_element(:css,"div#overlay").displayed?}
		@browser.find_element(:css,"div#overlay a#jr_overlay_close").click
		@browser.navigate.refresh   #just to avoid some overlays
	end

	def open_cart
		@browser.find_element(:css,"a.header_cart").click
	end

end