Feature: CSDN-CustomerCommunication

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


   @CustomerCommunication_AddressCreate1
  Scenario: CustomerCommunication-AddressCreate1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @CustomerCommunication_AddressCreate2
  Scenario: CustomerCommunication-AddressCreate2
    #SourceSystem değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.SourceSystem = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @CustomerCommunication_AddressCreate3
  Scenario: CustomerCommunication-AddressCreate3
    #AddressFullText değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.AddressFullText = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @CustomerCommunication_AddressCreate4
  Scenario: CustomerCommunication-AddressCreate4
    #CountryId değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.CountryId = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CustomerCommunication_AddressCreate5
  Scenario: CustomerCommunication-AddressCreate5
    #CityId değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.CityId = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CustomerCommunication_AddressCreate6
  Scenario: CustomerCommunication-AddressCreate6
    #CountyId değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.CountyId = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CustomerCommunication_AddressCreate7
  Scenario: CustomerCommunication-AddressCreate7
    #AddressTypeCode değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.AddressTypeCode = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @CustomerCommunication_AddressCreate8
  Scenario: CustomerCommunication-AddressCreate8
    #CustomerId değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.CustomerId = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CustomerCommunication_AddressCreate9
  Scenario: CustomerCommunication-AddressCreate9
    #CustomerType değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.CustomerType = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @CustomerCommunication_AddressCreate10
  Scenario: CustomerCommunication-AddressCreate10
    #User değeri girilmeden create işlemi yapılması
    Given path 'customercommunication/addresscreate'
    * def customercommunication_addresscreate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressCreate.json')
    * set customercommunication_addresscreate.Request.User = ''
    Given request customercommunication_addresscreate
    * print customercommunication_addresscreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


    @CostumerCommunication_AddressSearch1
  Scenario: CustomerCommunication-AddressSearch1
    #Tüm değerler girilerek search işlemi yapılması
    Given path 'customercommunication/addresssearch'
    * def customercommunication_addresssearch = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressSearch.json')
    Given request customercommunication_addresssearch
    * print customercommunication_addresssearch
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].Id == '#notnull'


  @CostumerCommunication_AddressSearch2
  Scenario: CustomerCommunication-AddressSearch2
    #CustomerId değeri girilmeden search işlemi yapılması
    Given path 'customercommunication/addresssearch'
    * def customercommunication_addresssearch = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressSearch.json')
    * set customercommunication_addresssearch.Request.CustomerId = ''
    Given request customercommunication_addresssearch
    * print customercommunication_addresssearch
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CostumerCommunication_AddressSearch3
  Scenario: CustomerCommunication-AddressSearch3
    #User değeri girilmeden search işlemi yapılması
    Given path 'customercommunication/addresssearch'
    * def customercommunication_addresssearch = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressSearch.json')
    * set customercommunication_addresssearch.Request.User = ''
    Given request customercommunication_addresssearch
    * print customercommunication_addresssearch
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CostumerCommunication_AddressUpdate1
  Scenario: CustomerCommunication-AddressUpdate1
    #Tüm değerler girilerek adres update işlemi yapılması
    Given path 'customercommunication/addressupdate'
    * def customercommunication_addressupdate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressUpdate.json')
    Given request customercommunication_addressupdate
    * print customercommunication_addressupdate
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @CostumerCommunication_AddressUpdate2
  Scenario: CustomerCommunication-AddressUpdate2
    #Id değeri girilmeden adres update işlemi yapılması
    Given path 'customercommunication/addressupdate'
    * def customercommunication_addressupdate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressUpdate.json')
    * set customercommunication_addressupdate.Request.Id = ''
    Given request customercommunication_addressupdate
    * print customercommunication_addressupdate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CostumerCommunication_AddressUpdate3
  Scenario: CustomerCommunication-AddressUpdate3
    #SourceSystem değeri girilmeden adres update işlemi yapılması
    Given path 'customercommunication/addressupdate'
    * def customercommunication_addressupdate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressUpdate.json')
    * set customercommunication_addressupdate.Request.SourceSystem = ''
    Given request customercommunication_addressupdate
    * print customercommunication_addressupdate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @CostumerCommunication_AddressUpdate4
  Scenario: CustomerCommunication-AddressUpdate4
    #User değeri girilmeden adres update işlemi yapılması
    Given path 'customercommunication/addressupdate'
    * def customercommunication_addressupdate = read('../CSDN/JsonFiles/CustomerCommunication/CustomerCommunication_AddressUpdate.json')
    * set customercommunication_addressupdate.Request.User = ''
    Given request customercommunication_addressupdate
    * print customercommunication_addressupdate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CostumerCommunication_City
  Scenario: CustomerCommunication-City
    #customercommunication/city
    Given path 'customercommunication/city'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content.CityList[0].CityId == '#notnull'


  @CostumerCommunication_TaxOffice
  Scenario: CustomerCommunication-TaxOffice
    #customercommunication/taxoffice
    Given path 'customercommunication/taxoffice'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content.TaxOfficeList[0].TaxOfficeId == '#notnull'