class HomePage
	include Helper
	
	$wait_for_element= Selenium::WebDriver::Wait.new(:timeout => 10)
	$wait_for_error= Selenium::WebDriver::Wait.new(:timeout => 4)
	
	def initialize(browser)
    	@browser = browser
    	visit()
    	@browser.manage.timeouts.implicit_wait = 10
    	raise('Exception: Home page is not opening') unless @browser.title.include? "Online Shopping Women"# Clothes, Shoes, Accessories, Bags - LimeRoad.com"
	end

	def visit
		@browser.get("http://www.limeroad.com")
	end

	def enter_your_email(email)
		$wait_for_element.until{@browser.find_element(:css,"form#signup_form div.txtbx input").displayed?}
		@browser.find_element(:css,"form#signup_form div.txtbx input").send_keys(email)
	end

	def click_signup
		@browser.find_element(:css,"form#signup_form input.login_submit.new").click
	end

	def click_signin
		$wait_for_element.until{@browser.find_element(:css,"form#signup_form").displayed?}
		@browser.find_element(:css,"a.signin_link.signupbox.talignl").click
	end

	def existing_user_signin(email,password)
		$wait_for_element.until{@browser.find_element(:css,"form#signin_form input.customer_email").displayed?}
		@browser.find_element(:css,"form#signin_form input.customer_email").send_keys(email)
		passwrod_field = @browser.find_element(:css,"form#signin_form input.customer_password")
		passwrod_field.send_keys(password)
		@browser.find_element(:css,"form#signin_form input.login_submit").click
		wait_for_signin = Selenium::WebDriver::Wait.new(:timeout => SIGNIN_WAIT)
		wait_for_signin.until{@browser.find_element(:css,"div.main-container img.feed-tutorial-img").displayed?}
	end

	def create_password(password)
		$wait_for_element.until{@browser.find_element(:css,"form#signup_profile_form input.customer_password").displayed?}
		passwrod_field = @browser.find_element(:css,"form#signup_profile_form input.customer_password")
		passwrod_field.send_keys(password)
	end

	def type_first_name(first_name)
		first_name_field = @browser.find_element(:css,"form#signup_profile_form input.first_name")
		first_name_field.send_keys(first_name)
	end

	def type_last_name(last_name)
		last_name_field = @browser.find_element(:css,"form#signup_profile_form input.last_name")
		last_name_field.send_keys(last_name)
	end

	def confirm
		@browser.find_element(:css,"form#signup_profile_form input.confirm-password").click
	end

	def close_the_modal
		@browser.find_element(:css,"div#overlay a#jr_overlay_close").click
		@browser.navigate.refresh
	end

	def close_like_form
		begin
			$wait_for_element.unitl{@browser.find_element(:css,"img.feed-tutorial-btn-done").displayed?}
			@browser.find_element(:css,"img.feed-tutorial-btn-done").click
		rescue
			@browser.navigate.refresh
			puts "NO like form"
		end
	end


	def modal_displayed?
		begin
			$wait_for_element.until{@browser.find_element(:css,"div#overlay").displayed?}
		rescue
			false
		end
	end

	def signup_modal_displayed?
		begin
			wait = Selenium::WebDriver::Wait.new(:timeout => SIGNUP_WAIT)
			wait.until{@browser.find_element(:css,"div#overlay div.verify-box-heading").displayed?}
		rescue
			false
		end
	end	
			

	def error_displayed?
		begin
			$wait_for_error.until{@browser.find_element(:css,"form#signup_profile_form input.customer_password.error").displayed?}
		rescue
			return false
		end
	end

	def click_sale
		$wait_for_element.until{@browser.find_element(:css,"nav.navbar li#sale a").displayed?}
		@browser.find_element(:css,"nav.navbar li#sale a").click
		SalePage.new(@browser)
	end
end

