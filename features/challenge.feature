Feature: Challenges Management
  In order to be able to keep track of my challenges
  As a user
  I should be able to manage my challenges

  Background:
    Given I am a registered user
    And I am logged in
  
  Scenario: Listing challenges that I created
    Given I have added several challenges
    When I visit the homepage
    Then I should see the list of my challenges