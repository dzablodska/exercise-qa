Feature: Get candidates

  Scenario: Verify getCandidates endpoint returns 200 status code

    Given I am anonymous
    When I send a 'GET' request to '/candidates'
    Then I should receive a response with the status 200

  Scenario: Verify createCandidate endpoint returns 201 status code

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'POST' request to '/candidates'
    When I add the request body:
"""
{"firstName": "Daria","lastName": "Z","matchingScore": 3,"vacancyTitle": "President"}
"""
    Then I should receive a response with the status 201

  Scenario: Verify that anonymous user cannot createCandidate

    Given I am anonymous
    When I send a 'POST' request to '/candidates'
    Then I should receive a response with the status 401

  Scenario: Verify updateCandidate endpoint returns 200 status code

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'PUT' request to '/candidates/222222'
    When I add the request body:
"""
{"firstName":"T","lastName":"GrytsenkoT","vacancyTitle":"QA Engineer","matchingScore":100}
"""
    Then I should receive a response with the status 200

  Scenario: Verify an error is returned when incorrect matchingScore value type has been passed

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'PUT' request to '/candidates/333333'
    When I add the request body:
"""
{"firstName":"Robert","lastName":"Szabo","vacancyTitle":"Product Owner","matchingScore":aaa}
"""
    Then I should receive a response with the status 400

  Scenario: Verify an error is returned when matchingScore value exceeding maximum has been passed

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'PUT' request to '/candidates/333333'
    When I add the request body:
"""
{"firstName":"Robert","lastName":"Szabo","vacancyTitle":"Product Owner","matchingScore":101}
"""
    Then I should receive a response with the status 400

  Scenario: Verify an error is returned when matchingScore value exceeding minimum has been passed

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'PUT' request to '/candidates/333333'
    When I add the request body:
"""
{"firstName":"Robert","lastName":"Szabo","vacancyTitle":"Product Owner","matchingScore":-1}
"""
    Then I should receive a response with the status 400

  Scenario: Verify that anonymous user cannot updateCandidate

    Given I am anonymous
    When I send a 'PUT' request to '/candidates/222222'
    Then I should receive a response with the status 401


  Scenario: Verify an error is returned when incorrect lastName value type has been passed

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'PUT' request to '/candidates/333333'
    When I add the request body:
"""
{"lastName":1}
"""
    Then I should receive a response with the status 400


  Scenario: Verify an error is returned when incorrect firstName value type has been passed

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'PUT' request to '/candidates/333333'
    When I add the request body:
"""
{"firstName":2}
"""
    Then I should receive a response with the status 400


  Scenario: Verify an error is returned when unknownParameter value type has been passed

    Given I am using basic authentication with the credentials:
      | username | tester  |
      | password | iloveqa |
    When I send a 'PUT' request to '/candidates/333333'
    When I add the request body:
"""
{"unknownParameter":1}
"""
    Then I should receive a response with the status 400
