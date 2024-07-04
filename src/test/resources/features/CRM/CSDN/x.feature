Feature: x

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'

    Scenario: test

    Given path 'vehicle/delete'
    * def vehicle_delete = read('../CSDN/JsonFiles/Vehicle/VehicleDelete.json')
    Given request vehicle_delete
    * print vehicle_delete
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsRemoved == true
