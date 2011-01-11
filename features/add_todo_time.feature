Feature: Add todo item
  In order to get my important todo items recored so that I can get to working on them
  As a busy person
  I want to add an item to my existing todo list

  Scenario: Get to add todo page from the todos page
    Given I am on the todos page
    When I follow "add item"
    Then I am on the new todo page
  
  
  Scenario: Create normal todo item
    Given there are no to do items in the system
	And I am on the new todo page
	When I fill in the following:
		| description  | get milk |
	And I save the todo item
    Then I should be on the todos page
    And todo item "get milk" exists with create time close to now
	And I should see "Todo Item Added" within "#messages"
	

  Scenario: Don't allow a todo item that is large
    Given there are no to do items in the system
	And I am on the new todo page
    When I fill in "description" with 501 character description
	And I save the todo item
    Then I should see "Description is too long (maximum is 500 characters)"
	And there are 0 todos in the system


  Scenario: Don't allow a todo item that is too small
    Given there are no to do items in the system
	And I am on the new todo page
	When I fill in "description" with ""
	And I save the todo item
	Then I should see "Description is too short (minimum is 1 characters)"
	And there are 0 todos in the system


  
  	
  
  
  
  
    
