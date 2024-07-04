Feature: CSDN-Relation

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'



  @Relation_Create1
  Scenario: Relation-Create1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'relation/create'
    * def relation_create = read('../CSDN/JsonFiles/Relation/RelationCreate.json')
    Given request relation_create
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Relation_Create2
  Scenario: Relation-Create2
    #SourceSystem değeri girilmeden create işlemi yapılması
    Given path 'relation/create'
    * def relation_create = read('../CSDN/JsonFiles/Relation/RelationCreate.json')
    * set relation_create.Request.SourceSystem = ''
    Given request relation_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Relation_Create3
  Scenario: Relation-Create3
    #AccountId değeri girilmeden create işlemi yapılması
    Given path 'relation/create'
    * def relation_create = read('../CSDN/JsonFiles/Relation/RelationCreate.json')
    * set relation_create.Request.AccountId = ''
    Given request relation_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Relation_Create4
  Scenario: Relation-Create4
    #ContactId değeri girilmeden create işlemi yapılması
    Given path 'relation/create'
    * def relation_create = read('../CSDN/JsonFiles/Relation/RelationCreate.json')
    * set relation_create.Request.ContactId = ''
    Given request relation_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Relation_Create5
  Scenario: Relation-Create5
    #RelationType değeri girilmeden create işlemi yapılması
    Given path 'relation/create'
    * def relation_create = read('../CSDN/JsonFiles/Relation/RelationCreate.json')
    * set relation_create.Request.RelationType = ''
    Given request relation_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Relation_Create6
  Scenario: Relation-Create6
    #User değeri girilmeden create işlemi yapılması
    Given path 'relation/create'
    * def relation_create = read('../CSDN/JsonFiles/Relation/RelationCreate.json')
    * set relation_create.Request.User = ''
    Given request relation_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Relation_Search1
  Scenario: Relation-Search1
    #Tüm değerler girilerek search işlemi yapılması
    Given path 'relation/search'
    * def relation_search = read('../CSDN/JsonFiles/Relation/RelationSearch.json')
    Given request relation_search
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].AccountContactRelationId == '#notnull'


  @Relation_Search2
  Scenario: Relation-Search2
    #AccountId değeri girilmeden search işlemi yapılması
    Given path 'relation/search'
    * def relation_search = read('../CSDN/JsonFiles/Relation/RelationSearch.json')
    * set relation_search.Request.AccountId = ''
    Given request relation_search
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].AccountContactRelationId == '#notnull'


  @Relation_Search3
  Scenario: Relation-Search3
    #ContactId değeri girilmeden search işlemi yapılması
    Given path 'relation/search'
    * def relation_search = read('../CSDN/JsonFiles/Relation/RelationSearch.json')
    * set relation_search.Request.ContactId = ''
    Given request relation_search
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].AccountContactRelationId == '#notnull'


  @Relation_Search4
  Scenario: Relation-Search4
    #User değeri girilmeden search işlemi yapılması
    Given path 'relation/search'
    * def relation_search = read('../CSDN/JsonFiles/Relation/RelationSearch.json')
    * set relation_search.Request.User = ''
    Given request relation_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Relation_Update1
  Scenario: Relation-Update1
    #Tüm değerler girilerek update işlemi yapılması
    Given path 'relation/update'
    * def relation_update = read('../CSDN/JsonFiles/Relation/RelationUpdate.json')
    Given request relation_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Relation_Update2
  Scenario: Relation-Update2
    #Id değeri girilmeden update işlemi yapılması
    Given path 'relation/update'
    * def relation_update = read('../CSDN/JsonFiles/Relation/RelationUpdate.json')
    * set relation_update.Request.Id = ''
    Given request relation_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Relation_Update3
  Scenario: Relation-Update3
    #SourceSystem değeri girilmeden update işlemi yapılması
    Given path 'relation/update'
    * def relation_update = read('../CSDN/JsonFiles/Relation/RelationUpdate.json')
    * set relation_update.Request.SourceSystem = ''
    Given request relation_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Relation_Update4
  Scenario: Relation-Update4
    #RelationType değeri girilmeden update işlemi yapılması
    Given path 'relation/update'
    * def relation_update = read('../CSDN/JsonFiles/Relation/RelationUpdate.json')
    * set relation_update.Request.RelationType = ''
    Given request relation_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Relation_Update5
  Scenario: Relation-Update5
    #Status değeri girilmeden update işlemi yapılması
    Given path 'relation/update'
    * def relation_update = read('../CSDN/JsonFiles/Relation/RelationUpdate.json')
    * set relation_update.Request.Status = ''
    Given request relation_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Relation_Update6
  Scenario: Relation-Update6
    #User değeri girilmeden update işlemi yapılması
    Given path 'relation/update'
    * def relation_update = read('../CSDN/JsonFiles/Relation/RelationUpdate.json')
    * set relation_update.Request.User = ''
    Given request relation_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'
