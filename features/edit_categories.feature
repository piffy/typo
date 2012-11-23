Feature: Edit Categories
  As an author
  In order to gift my thoughts to the world
  I want to create a blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Add new category
    Given I am on the categories page
    And I fill in "category_name" with "New category"
    And I fill in "category_keywords" with "chicken pigs"
    And I fill in "category_description" with "A thoughtful description"
    And I press "Save"
    Then I should see "Category was successfully saved"
    And  I should see "New category"
    When I follow "New category"
    And I fill in "category_name" with "Different category"
    And I fill in "category_description" with "A thoughtful description"
    And I press "Save"
    Then I should see "Category was successfully saved"
    And  I should see "Different category"



