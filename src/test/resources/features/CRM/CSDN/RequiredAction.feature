Feature: CSDN-RequiredAction

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @RequiredAction_UserId_ApplicationId
  Scenario: RequiredAction - {userid}/{applicationid}
    #requiredaction/{userid}/{applicationid}
    Given path 'requiredaction/c7dc8a08-4c90-ea11-a811-000d3a64a52d/6bf9aa83-32a4-ea11-a812-000d3a64a318'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content.ActionList[0].Title == '#notnull'