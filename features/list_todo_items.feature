Feature: List todo items
  In order to see everything i need to get done
  As a busy person
  I want to see all of my to do items in one place

  Scenario: Empty todo list
    Given there are no to do items in the system
    When I go to the todos page
    Then I should see "You're all done!"

  Scenario: To do list with items
    Given there are only the following todo items:
		| item | created_at |
		| get milk | 2010-11-06 12:00 |
		| take out the trash |2010-03-16 12:00 |
		| paint bedroom |2010-01-06 12:00 |
    When I go to the todos page
	Then I should not see "You're all done!"	
    And I should see the following in "#todoItems":
		| item | created_at |
		| get milk | 2010-11-06 12:00 |
		| take out the trash | 2010-03-16 12:00 |
		| paint bedroom | 2010-01-06 12:00 |
  
  
  
  
  
  

  
