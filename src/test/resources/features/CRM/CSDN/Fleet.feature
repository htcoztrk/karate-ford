Feature: CSDN-Fleet

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Fleet_Search1
  Scenario: Fleet-Search1
    #Tüm değerler girilerek search işlemi yapılması
    Given path 'fleet/search'
    * def fleet_search = read('../CSDN/JsonFiles/Fleet/FleetSearch.json')
    Given request fleet_search
    * print fleet_search
    When method POST
    Then status 200
    * print response
    * match response.Data.Content == '#notnull'


  @Fleet_Search2
  Scenario: Fleet-Search2
    #AccountId değeri girilmeden search işlemi yapılması
    Given path 'fleet/search'
    * def fleet_search = read('../CSDN/JsonFiles/Fleet/FleetSearch.json')
    * set fleet_search.Request.AccountId = ''
    Given request fleet_search
    * print fleet_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Fleet_Search3
  Scenario: Fleet-Search3
    #VehicleId değeri girilmeden search işlemi yapılması
    Given path 'fleet/search'
    * def fleet_search = read('../CSDN/JsonFiles/Fleet/FleetSearch.json')
    * set fleet_search.Request.VehicleId = ''
    Given request fleet_search
    * print fleet_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'

