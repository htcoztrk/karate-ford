Feature: CSDN-CustomerBehavior

Background:
* header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
* configure ssl = true
* header Content-Type = 'application/json'
* url 'https://uatcsdn-dev.azurewebsites.net'



  @CustomerBehavior_Create1
  Scenario: CustomerBehavior-Create1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.CustomerBehaviorCreateDataList[0].RequestId == '#notnull'


  @CustomerBehavior_Create2
  Scenario: CustomerBehavior-Create2
    #CustomerId değerleri girilmeden create işlemi yapılması
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].CustomerId = ''
    * set customerbehavior_create.Request.CustomerBehaviorList[1].CustomerId = ''
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @CustomerBehavior_Create3
  Scenario: CustomerBehavior-Create3
    #Geçersiz TotalValueSegmentTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].TotalValueSegmentTypeCode = 15
    * set customerbehavior_create.Request.CustomerBehaviorList[1].TotalValueSegmentTypeCode = 20
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create4
  Scenario: CustomerBehavior-Create4
    #Geçersiz ServicevalueTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].ServicevalueTypeCode = 5
    * set customerbehavior_create.Request.CustomerBehaviorList[1].ServicevalueTypeCode = 5
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create5
  Scenario: CustomerBehavior-Create5
    #Geçersiz ServiceLoyalTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].ServiceLoyalTypeCode = 2
    * set customerbehavior_create.Request.CustomerBehaviorList[1].ServiceLoyalTypeCode = 2
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create6
  Scenario: CustomerBehavior-Create6
    #Geçersiz ServiceMainTypeCode.Value değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].ServiceMainTypeCode[0].Value = 3
    * set customerbehavior_create.Request.CustomerBehaviorList[1].ServiceMainTypeCode[1].Value = 3
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create7
  Scenario: CustomerBehavior-Create7
    #Geçersiz ServiceitemTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].ServiceitemTypeCode = 4
    * set customerbehavior_create.Request.CustomerBehaviorList[1].ServiceitemTypeCode = 5
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create8
  Scenario: CustomerBehavior-Create8
    #Geçersiz ServiceActivityTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].ServiceActivityTypeCode = 4
    * set customerbehavior_create.Request.CustomerBehaviorList[1].ServiceActivityTypeCode = 5
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create9
  Scenario: CustomerBehavior-Create9
    #Geçersiz SecondHandServiceLoyalTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SecondHandServiceLoyalTypeCode = 2
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SecondHandServiceLoyalTypeCode = 3
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create10
  Scenario: CustomerBehavior-Create10
    #Geçersiz SecondHandSaleLoyalTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SecondHandSaleLoyalTypeCode = 2
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SecondHandSaleLoyalTypeCode = 3
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create11
  Scenario: CustomerBehavior-Create11
    #Geçersiz SaleValueTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SaleValueTypeCode = 7
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SaleValueTypeCode = 8
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create12
  Scenario: CustomerBehavior-Create12
    #Geçersiz SaleLoyalTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SaleLoyalTypeCode = 2
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SaleLoyalTypeCode = 18
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create13
  Scenario: CustomerBehavior-Create13
    #Geçersiz SaleActivityTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SaleActivityTypeCode = 4
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SaleActivityTypeCode = 5
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create14
  Scenario: CustomerBehavior-Create14
    #Geçersiz ProcessTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].ProcessTypeCode[0].Value = 3
    * set customerbehavior_create.Request.CustomerBehaviorList[1].ProcessTypeCode[1].Value = 4
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create15
  Scenario: CustomerBehavior-Create15
    #Geçersiz PurchaseaimTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].PurchaseaimTypeCode[0].Value = 7
    * set customerbehavior_create.Request.CustomerBehaviorList[1].PurchaseaimTypeCode[1].Value = 8
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create16
  Scenario: CustomerBehavior-Create16
    #Geçersiz FordoptionsTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].FordoptionsTypeCode[0].Value = 3
    * set customerbehavior_create.Request.CustomerBehaviorList[1].FordoptionsTypeCode[1].Value = 4
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create17
  Scenario: CustomerBehavior-Create17
    #Geçersiz FinsuranceStatusTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].FinsuranceStatusTypeCode[0].Value = 3
    * set customerbehavior_create.Request.CustomerBehaviorList[1].FinsuranceStatusTypeCode[1].Value = 4
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create18
  Scenario: CustomerBehavior-Create18
    #Geçersiz FinancialChannelTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].FinancialChannelTypeCode = 3
    * set customerbehavior_create.Request.CustomerBehaviorList[1].FinancialChannelTypeCode = 4
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create19
  Scenario: CustomerBehavior-Create19
    #Geçersiz FinancePartnerTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].FinancePartnerTypeCode[0].Value = 3
    * set customerbehavior_create.Request.CustomerBehaviorList[1].FinancePartnerTypeCode[1].Value = 4
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'


  @CustomerBehavior_Create20
  Scenario: CustomerBehavior-Create20
    #Geçersiz ExposuretimeTypeCode değeri ile create işlemi yapma
    Given path 'customerbehavior/create'
    * def randomSegmentationPeriod = read('../CSDN/RandomValue/RandomDeger.js')
    * def customerbehavior_create = read('../CSDN/JsonFiles/CustomerBehavior/CustomerBehaviorCreate.json')
    * set customerbehavior_create.Request.CustomerBehaviorList[0].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[1].SegmentationPeriod = call randomSegmentationPeriod
    * set customerbehavior_create.Request.CustomerBehaviorList[0].ExposuretimeTypeCode = 6
    * set customerbehavior_create.Request.CustomerBehaviorList[1].ExposuretimeTypeCode = 4
    Given request customerbehavior_create
    * print customerbehavior_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    * match response.ValidationList[1].Message == 'Parametre değeri geçersiz.'