Feature: CSDN-Lead

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Lead_Create1
  Scenario: Lead-Create1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Lead_Create2
  Scenario: Lead-Create2
    #ProcessTypeCode değeri girilmeden create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    * set lead_create.Request.ProcessTypeCode = ''
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Lead_Create3
  Scenario: Lead-Create3
    #CustomerTypeCode değeri girilmeden create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    * set lead_create.Request.CustomerTypeCode = ''
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Lead_Create4
  Scenario: Lead-Create4
    #ChannelTypeCode değeri girilmeden create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    * set lead_create.Request.ChannelTypeCode = ''
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Lead_Create5
  Scenario: Lead-Create5
    #ResourceTypeCode değeri girilmeden create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    * set lead_create.Request.ResourceTypeCode = ''
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Lead_Create6
  Scenario: Lead-Create6
    #LastUpdateSystemCode değeri girilmeden create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    * set lead_create.Request.LastUpdateSystemCode = ''
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Lead_Create7
  Scenario: Lead-Create7
    #SourceSystemCode değeri girilmeden create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    * set lead_create.Request.SourceSystemCode = ''
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Lead_Create8
  Scenario: Lead-Create8
    #BusinessUnitId değeri girilmeden create işlemi yapılması
    Given path 'lead/create'
    * def lead_create = read('../CSDN/JsonFiles/Lead/LeadCreate.json')
    * set lead_create.Request.BusinessUnitId = ''
    Given request lead_create
    * print lead_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'

