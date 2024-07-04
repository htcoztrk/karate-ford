Feature: CSDN-Quote

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'



  @Quote_Create1
  Scenario: Quote-Create1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'quote/create'
    * def quote_create = read('../CSDN/JsonFiles/Quote/QuoteCreate.json')
    * def randomOpsQuoteId = read('../CSDN/RandomValue/RandomDeger.js')
    * set quote_create.Request.OpsQuoteId = call randomOpsQuoteId
    Given request quote_create
    * print quote_create
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.QuoteDetailCreateData[0].Id == '#notnull'


  @Quote_Create2
  Scenario: Quote-Create2
    #UserId değeri girilmeden create işlemi yapılması
    Given path 'quote/create'
    * def quote_create = read('../CSDN/JsonFiles/Quote/QuoteCreate.json')
    * def randomOpsQuoteId = read('../CSDN/RandomValue/RandomDeger.js')
    * set quote_create.Request.OpsQuoteId = call randomOpsQuoteId
    * set quote_create.Request.UserId = ''
    Given request quote_create
    * print quote_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Quote_Create3
  Scenario: Quote-Create3
    #CustomerType değeri girilmeden create işlemi yapılması
    Given path 'quote/create'
    * def quote_create = read('../CSDN/JsonFiles/Quote/QuoteCreate.json')
    * def randomOpsQuoteId = read('../CSDN/RandomValue/RandomDeger.js')
    * set quote_create.Request.OpsQuoteId = call randomOpsQuoteId
    * set quote_create.Request.CustomerType = ''
    Given request quote_create
    * print quote_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Quote_Create4
  Scenario: Quote-Create4
    #CustomerId değeri girilmeden create işlemi yapılması
    Given path 'quote/create'
    * def quote_create = read('../CSDN/JsonFiles/Quote/QuoteCreate.json')
    * def randomOpsQuoteId = read('../CSDN/RandomValue/RandomDeger.js')
    * set quote_create.Request.OpsQuoteId = call randomOpsQuoteId
    * set quote_create.Request.CustomerId = ''
    Given request quote_create
    * print quote_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Quote_Create5
  Scenario: Quote-Create5
    #SourceSystemCode değeri girilmeden create işlemi yapılması
    Given path 'quote/create'
    * def quote_create = read('../CSDN/JsonFiles/Quote/QuoteCreate.json')
    * def randomOpsQuoteId = read('../CSDN/RandomValue/RandomDeger.js')
    * set quote_create.Request.OpsQuoteId = call randomOpsQuoteId
    * set quote_create.Request.SourceSystemCode = ''
    Given request quote_create
    * print quote_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Quote_Create6
  Scenario: Quote-Create6
    #SourceSystem değeri 4 ve OpsQuoteId boş iken create işlemi yapılması
    Given path 'quote/create'
    * def quote_create = read('../CSDN/JsonFiles/Quote/QuoteCreate.json')
    * def randomOpsQuoteId = read('../CSDN/RandomValue/RandomDeger.js')
    * set quote_create.Request.OpsQuoteId = call randomOpsQuoteId
    * set quote_create.Request.SourceSystemCode = '4'
    * set quote_create.Request.OpsQuoteId = ''
    Given request quote_create
    * print quote_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Quote_Update1
  Scenario: Quote-Update1
    #Tüm değerler girilerek search işlemi yapılması
    Given path 'quote/update'
    * def quote_update = read('../CSDN/JsonFiles/Quote/QuoteUpdate.json')
    Given request quote_update
    * print quote_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Quote_Update2
  Scenario: Quote-Update2
    #QuoteId değeri girilmeden update işlemi yapılması
    Given path 'quote/update'
    * def quote_update = read('../CSDN/JsonFiles/Quote/QuoteUpdate.json')
    * set quote_update.Request.QuoteId = ''
    Given request quote_update
    * print quote_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Quote_Update3
  Scenario: Quote-Update3
    #UserId değeri girilmeden update işlemi yapılması
    Given path 'quote/update'
    * def quote_update = read('../CSDN/JsonFiles/Quote/QuoteUpdate.json')
    * set quote_update.Request.UserId = ''
    Given request quote_update
    * print quote_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Quote_Update4
  Scenario: Quote-Update4
    #SourceSystemCode değeri girilmeden update işlemi yapılması
    Given path 'quote/update'
    * def quote_update = read('../CSDN/JsonFiles/Quote/QuoteUpdate.json')
    * set quote_update.Request.SourceSystemCode = ''
    Given request quote_update
    * print quote_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
