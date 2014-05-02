#helper module for common functions
module Helper
	def generate_unique_email
		"yeshwant007+#{rand(1000)}@gmail.com"
	end

	def signup_heading
		@browser.find_element(:css,"div#overlay div.verify-box-heading").text
	end
end