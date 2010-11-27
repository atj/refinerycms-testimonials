@testimonials
Feature: Testimonials
  In order to have testimonials on my website
  As an administrator
  I want to manage testimonials

  Background:
    Given I am a logged in refinery user
    And I have no testimonials

  @testimonials-list @list
  Scenario: Testimonials List
   Given I have a testimonial by "Joe Bloggs" from "ACME" saying "RefineryCMS is great!"
   And I have a testimonial by "Sarah Palin" saying "North Korea is our ally!"
   When I go to the list of testimonials
   Then I should see "Joe Bloggs, ACME"
   And I should see "Sarah Palin"

  @testimonials-valid @valid
  Scenario: Create Valid Testimonial
    When I go to the list of testimonials
    And I follow "Add New Testimonial"
    And I fill in "Name" with "This is a test of the first string field"
    And I fill in "Quote" with "This is a quote"
    And I press "Save"
    Then I should see "'Quote by This is a test of the first string field' was successfully added."
    And I should have 1 testimonial

  @testimonials-invalid @invalid
  Scenario: Create Invalid Testimonial (without name)
    When I go to the list of testimonials
    And I follow "Add New Testimonial"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 testimonials

  @testimonials-edit @edit
  Scenario: Edit Existing Testimonial
    Given I have a testimonial by "A name" saying "quote"
    When I go to the list of testimonials
    And I follow "Edit this testimonial" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'Quote by A different name' was successfully updated."
    And I should be on the list of testimonials
    And I should not see "A name"

  @testimonials-delete @delete
  Scenario: Delete Testimonial
    Given I have no testimonials 
    And I have a testimonial by "A name" saying "A quote"
    When I go to the list of testimonials
    And I follow "Remove this testimonial forever"
    Then I should see "'Quote by A name' was successfully removed."
    And I should have 0 testimonials
 
