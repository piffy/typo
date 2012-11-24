Feature: Merge Articles
  As a blog administrator
  In order to show all of my thoughts
  I want to be able to merge two articles


  Background:
    Given the blog is set up
    And a non-admin user exists
    And an article has been posted
    And a second article has been posted


  Scenario: Administrator can Merge articles
    And I am logged into the admin panel
    And I am on the edit page
    Then I should see "Merge Articles"
    When I fill the second article id
    And I press "Merge"
    Then I should see "Articles merged"



  Scenario: Show the merged articles
    Given two articles are merged
    When I am on the view page
    Then I should see "Welcome to Typo"
    And  I should see "More interesting stuff"



  Scenario: Show the merged comments
    Given two articles are merged
    And article "1" has "Remark" for comment
    And article "4" has "discussion" for comment
    When I am on the view page
    Then I should see "Remark"
    And  I should see "discussion"


  Scenario: A non-admin cannot merge two articles
    Given a non-admin is logged into the admin panel
    And I am on the edit page
    Then I should not see "Merge Articles"
    #And I am on the edit page






  Scenario: When articles are merged, the merged article should contain the text of both previous articles

  Scenario: the merged article should have one author (either one of the authors of the two original articles)

  Scenario: the merged article should have all the comments of the original authors

  Scenario: the title of the new article should be the title from either one of the merged articles

