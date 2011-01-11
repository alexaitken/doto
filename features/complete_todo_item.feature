Feature: Complete todo item
  In order to show what I have completed and not do work twice
  As a busy person
  I want to mark todo items as complete and see what is already been completed

  @wip
  Scenario: See completed tasks marked in the list
    Given there are only the following todo items:
		| description 			| completed |
		| get milk 				| false		|
		| take out the trash 	| true 		|
		| paint bedroom 		| false		|
    When I go to the todos page
    Then I should see "take out the trash" with a line through it
	And I should not see "get milk" with a line through it
	And I should not see "paint bedroom" with a line through it

	

  
  
  
  
  
  

  
