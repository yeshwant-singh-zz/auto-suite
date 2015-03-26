Feature: As a new user add items to cart

#Background: I can signup on limeroad  #background runs before each scenario
	#Given I go to limeroad.com
	#And I signup


Scenario Outline: User is able to add items to cart from sale page
	Given I go to sales page
	And I select <product> product
	When I add the item to cart
	Then my cart should have the item 

	Examples:
	| product 	|
	| third_bag	|


Scenario: User is able to add multiple items to cart from sale page
	Given I go to sales page
	And I add multiple products to cart
	|third_bag|
	|first_bag|
	Then my cart should have all the items


@wip
Scenario: go to flipkart and search
	Given I go to flipkart.com
	When I search for television
	Then I get the result

	