Feature: Merge Article
  As an admin
  In order to keep related material grouped together 
  I want to merge one article with another

  Background:
    Given the blog is set up
    And I am logged into the dashboard

  Scenario: Merge form shown to users with admin privileges
    Given I am on the article view
    And I am an admin
    Then I should see a field for entering an article ID to merge with
    And I should see a button next to it labeled "Merge"

  Scenario: Merge form hidden from users without admin privileges
    Given I am on the article view
    And I am not an admin
    Then I should not see a field for entering an article ID to merge with
    And I should not see a button next to it labeled "Merge"

  Scenario: Entering article ID and clicking Merge button successfully merges articles
    Given I am on the article view of an article (the Original Article)
    And I am an admin   
    When I fill in "merge_with" with the ID of another article (the Merged Article)
    And I press "Merge"
    Then a new article should be created (the New Article)
    And I should be on the article view page of that new article
    And the New Article should contain the text of both the Original Article and the Merged Article
    And I should see the comments on both the Original Article and the Merged Article 
    And the author of the New Article should be either the author of the Original Article or the author of the Merged Article
    And the title of the New Article should be either the title of the Original Article or the author of the Merged Article
