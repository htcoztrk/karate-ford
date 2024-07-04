Feature: CSDN-CustomerCardRequest

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @CustomerCardRequest_Approve1
  Scenario: CustomerCardRequest-Approve1
    #Tüm değerler girilerek onaylama işlemi yapılması
    Given path 'customercardrequest/approve'
    * def customerCardRequest_approve = read('../CSDN/JsonFiles/CustomerCardRequest/CustomerCardRequest_Approve.json')
    Given request customerCardRequest_approve
    * print customerCardRequest_approve
    When method POST
    Then status 200
    * print response
   # * match response.Data.Content.Id == '#notnull'