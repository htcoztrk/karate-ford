Feature: CSDN-Opportunity

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Opportunity_Create1
  Scenario: Opportunity-Create1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Opportunity_Create2
  Scenario: Opportunity-Create2
    #UserId değeri girilmeden create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    * set opportunity_create.Request.UserId = ''
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    #* match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_Create3
  Scenario: Opportunity-Create3
    #ContactId değeri girilmeden create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    * set opportunity_create.Request.ContactId = ''
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_Create4
  Scenario: Opportunity-Create4
    #MainCategoryId değeri girilmeden create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    * set opportunity_create.Request.MainCategoryId = ''
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_Create5
  Scenario: Opportunity-Create5
    #VehicleGroupId değeri girilmeden create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    * set opportunity_create.Request.VehicleGroupId = ''
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_Create6
  Scenario: Opportunity-Create6
    #SubCategoryId değeri girilmeden create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    * set opportunity_create.Request.SubCategoryId = ''
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_Create7
  Scenario: Opportunity-Create7
    #OpportunityTypeCode değeri girilmeden create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    * set opportunity_create.Request.OpportunityTypeCode = ''
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Opportunity_Create8
  Scenario: Opportunity-Create8
    #SourceSystemCode değeri girilmeden create işlemi yapılması
    Given path 'opportunity/create'
    * def opportunity_create = read('../CSDN/JsonFiles/Opportunity/OpportunityCreate.json')
    * set opportunity_create.Request.SourceSystemCode = ''
    Given request opportunity_create
    * print opportunity_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Opportunity_SalesSearch1
  Scenario: Opportunity-SalesSearch1
    #Tüm değerler girilerek satış arama işlemi yapılması
    Given path 'opportunity/salessearch'
    * def opportunity_salessearch = read('../CSDN/JsonFiles/Opportunity/Opportunity_SalesSearch.json')
    Given request opportunity_salessearch
    * print opportunity_salessearch
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].Owner.Id == '#notnull'


  @Opportunity_SalesSearch2
  Scenario: Opportunity-SalesSearch2
    #AccountId değeri girilmeden satış arama işlemi yapılması
    Given path 'opportunity/salessearch'
    * def opportunity_salessearch = read('../CSDN/JsonFiles/Opportunity/Opportunity_SalesSearch.json')
    * set opportunity_salessearch.Request.AccountId = ''
    Given request opportunity_salessearch
    * print opportunity_salessearch
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].Owner.Id == '#notnull'


  @Opportunity_SalesSearch3
  Scenario: Opportunity-SalesSearch3
    #ContactId değeri girilmeden satış arama işlemi yapılması
    Given path 'opportunity/salessearch'
    * def opportunity_salessearch = read('../CSDN/JsonFiles/Opportunity/Opportunity_SalesSearch.json')
    * set opportunity_salessearch.Request.ContactId = ''
    Given request opportunity_salessearch
    * print opportunity_salessearch
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].Owner.Id == '#notnull'


  @Opportunity_SalesSearch4
  Scenario: Opportunity-SalesSearch4
    #LeadId değeri girilmeden satış arama işlemi yapılması
    Given path 'opportunity/salessearch'
    * def opportunity_salessearch = read('../CSDN/JsonFiles/Opportunity/Opportunity_SalesSearch.json')
    * set opportunity_salessearch.Request.LeadId = ''
    Given request opportunity_salessearch
    * print opportunity_salessearch
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].Owner.Id == '#notnull'


  @Opportunity_SalesSearch5
  Scenario: Opportunity-SalesSearch5
    #User değeri girilmeden satış arama işlemi yapılması
    Given path 'opportunity/salessearch'
    * def opportunity_salessearch = read('../CSDN/JsonFiles/Opportunity/Opportunity_SalesSearch.json')
    * set opportunity_salessearch.Request.User = ''
    Given request opportunity_salessearch
    * print opportunity_salessearch
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_SalesSearch6
  Scenario: Opportunity-SalesSearch6
    #User hariç diğer değerlerin boş bırakılarak satış arama işlemi yapılması
    Given path 'opportunity/salessearch'
    * def opportunity_salessearch = read('../CSDN/JsonFiles/Opportunity/Opportunity_SalesSearch.json')
    * set opportunity_salessearch.Request.AccountId = ''
    * set opportunity_salessearch.Request.ContactId = ''
    * set opportunity_salessearch.Request.LeadId = ''
    * set opportunity_salessearch.Request.OpportunityId = ''
    Given request opportunity_salessearch
    * print opportunity_salessearch
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Alanların hepsi aynı anda boş olamaz.'


  @Opportunity_Search1
  Scenario: Opportunity-Search1
    #Tüm değerler girilerek search işlemi yapılması
    Given path 'opportunity/search'
    * def opportunity_search = read('../CSDN/JsonFiles/Opportunity/OpportunitySearch.json')
    Given request opportunity_search
    * print opportunity_search
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].OwnerId == '#notnull'


  @Opportunity_Search2
  Scenario: Opportunity-Search2
    #UserId değeri girilmeden search işlemi yapılması
    Given path 'opportunity/search'
    * def opportunity_search = read('../CSDN/JsonFiles/Opportunity/OpportunitySearch.json')
    * set opportunity_search.Request.UserId = ''
    Given request opportunity_search
    * print opportunity_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_Search3
  Scenario: Opportunity-Search3
    #Sadece UserId değeri girilerek search işlemi yapılması
    Given path 'opportunity/search'
    * def opportunity_search = read('../CSDN/JsonFiles/Opportunity/OpportunitySearch.json')
    * set opportunity_search.Request.VehicleId = ''
    * set opportunity_search.Request.MainCategoryId = ''
    * set opportunity_search.Request.BusinessUnitId = ''
    * set opportunity_search.Request.CreatedOn = ''
    Given request opportunity_search
    * print opportunity_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Alanların hepsi aynı anda boş olamaz.'


  @Opportunity_Update1
  Scenario: Opportunity-Update1
    #Tüm değerler girilerek update işlemi yapılması
    Given path 'opportunity/update'
    * def opportunity_update = read('../CSDN/JsonFiles/Opportunity/OpportunityUpdate.json')
    Given request opportunity_update
    * print opportunity_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Opportunity_Update2
  Scenario: Opportunity-Update2
    #OpportunityId değeri girilmeden update işlemi yapılması
    Given path 'opportunity/update'
    * def opportunity_update = read('../CSDN/JsonFiles/Opportunity/OpportunityUpdate.json')
    * set opportunity_update.Request.OpportunityId = ''
    Given request opportunity_update
    * print opportunity_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Opportunity_Update3
  Scenario: Opportunity-Update3
    #SecondHandPrice değeri girilmeden update işlemi yapılması
    Given path 'opportunity/update'
    * def opportunity_update = read('../CSDN/JsonFiles/Opportunity/OpportunityUpdate.json')
    * set opportunity_update.Request.SecondHandPrice = ''
    Given request opportunity_update
    * print opportunity_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Opportunity_Update4
  Scenario: Opportunity-Update4
    #LastUpdateSystemCode değeri girilmeden update işlemi yapılması
    Given path 'opportunity/update'
    * def opportunity_update = read('../CSDN/JsonFiles/Opportunity/OpportunityUpdate.json')
    * set opportunity_update.Request.LastUpdateSystemCode = ''
    Given request opportunity_update
    * print opportunity_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Opportunity_Update5
  Scenario: Opportunity-Update5
    #SecondHandPrice parametresine geçersiz değer girilerek update işlemi yapılması
    Given path 'opportunity/update'
    * def opportunity_update = read('../CSDN/JsonFiles/Opportunity/OpportunityUpdate.json')
    * set opportunity_update.Request.SecondHandPrice = 'a'
    Given request opportunity_update
    * print opportunity_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Opportunity_Update6
  Scenario: Opportunity-Update6
    # LastUpdateSystemCode parametresine geçersiz değer girilerek update işlemi yapılması
    Given path 'opportunity/update'
    * def opportunity_update = read('../CSDN/JsonFiles/Opportunity/OpportunityUpdate.json')
    * set opportunity_update.Request.LastUpdateSystemCode = 'a'
    Given request opportunity_update
    * print opportunity_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'







