Feature: As a existing user add items to cart

@tagged_scenario
Scenario Outline: User is able to add items to cart from sale page
	Given I go to limeroad.com
	And I signin
	And I go to sales page
	And I select <product> product
	When I add the item to cart
	Then my cart should have the item 

	Examples:
	| product 	|
	| third_bag	|