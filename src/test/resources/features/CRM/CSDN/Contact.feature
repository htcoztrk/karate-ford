Feature: CSDN-Contact

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Contact_Create1
  Scenario: Contact-Create1
    #SourceSystem değeri girilmeden create işlemi yapılması
    Given path 'contact/create'
    * def contact_create = read('../CSDN/JsonFiles/Contact/ContactCreate.json')
    * set contact_create.Request.SourceSystem = ''
    Given request contact_create
    * print contact_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Contact_Create2
  Scenario: Contact-Create2
    #Firstname değeri girilmeden create işlemi yapılması
    Given path 'contact/create'
    * def contact_create = read('../CSDN/JsonFiles/Contact/ContactCreate.json')
    * set contact_create.Request.Firstname = ''
    Given request contact_create
    * print contact_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Contact_Create3
  Scenario: Contact-Create3
    #Lastname değeri girilmeden create işlemi yapılması
    Given path 'contact/create'
    * def contact_create = read('../CSDN/JsonFiles/Contact/ContactCreate.json')
    * set contact_create.Request.Lastname = ''
    Given request contact_create
    * print contact_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Contact_Create4
  Scenario: Contact-Create4
    #GenderCode değeri girilmeden create işlemi yapılması
    Given path 'contact/create'
    * def contact_create = read('../CSDN/JsonFiles/Contact/ContactCreate.json')
    * set contact_create.Request.GenderCode = ''
    Given request contact_create
    * print contact_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Contact_Create5
  Scenario: Contact-Create5
    #User değeri girilmeden create işlemi yapılması
    Given path 'contact/create'
    * def contact_create = read('../CSDN/JsonFiles/Contact/ContactCreate.json')
    * set contact_create.Request.User = ''
    Given request contact_create
    * print contact_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Contact_Search1
  Scenario: Contact-Search1
    #Sadece User değeri girilerek search işlemi yapılması
    Given path 'contact/search'
    * def contact_search = read('../CSDN/JsonFiles/Contact/ContactSearch.json')
    * set contact_search.Request.User = '69ad94f2-dbf2-4a4b-b753-de18a7e10e8d'
    Given request contact_search
    * print contact_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Alanların hepsi aynı anda boş olamaz.'


  @Contact_Search2
  Scenario: Contact-Search2
    #Firstname ve User değerleri girilerek search işlemi yapılması
    Given path 'contact/search'
    * def contact_search = read('../CSDN/JsonFiles/Contact/ContactSearch.json')
    * set contact_search.Request.FirstName = 'test'
    * set contact_search.Request.User = '69ad94f2-dbf2-4a4b-b753-de18a7e10e8d'
    Given request contact_search
    * print contact_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Ad ve soyad alanları aynı anda girilmelidir.'


  @Contact_Search3
  Scenario: Contact-Search3
    #Middlename ve User değerleri girilerek search işlemi yapılması
    Given path 'contact/search'
    * def contact_search = read('../CSDN/JsonFiles/Contact/ContactSearch.json')
    * set contact_search.Request.Middlename = 'test'
    * set contact_search.Request.User = '69ad94f2-dbf2-4a4b-b753-de18a7e10e8d'
    Given request contact_search
    * print contact_search
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].DisabilityCodeName == '#notnull'


  @Contact_Search4
  Scenario: Contact-Search4
    #Lastname ve User değerleri girilerek search işlemi yapılması
    Given path 'contact/search'
    * def contact_search = read('../CSDN/JsonFiles/Contact/ContactSearch.json')
    * set contact_search.Request.Lastname = 'test'
    * set contact_search.Request.User = '69ad94f2-dbf2-4a4b-b753-de18a7e10e8d'
    Given request contact_search
    * print contact_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Ad ve soyad alanları aynı anda girilmelidir.'


  @Contact_Update1
  Scenario: Contact-Update1
    #SourceSystem değeri 10 ve EmailAddress alanı boş bırakılarak update işlemi yapılması
    Given path 'contact/update'
    * def contact_update = read('../CSDN/JsonFiles/Contact/ContactUpdate.json')
    * set contact_update.Request.SourceSystem =  10
    * set contact_update.Request.EmailAddress = ''
    Given request contact_update
    * print contact_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'SourceSystemCode değeri 10 (IDA) olduğunda E-Mail adresi boş bırakılamaz.'


  @Contact_Update2
  Scenario: Contact-Update2
    #User değeri girilmeden update işlemi yapılması
    Given path 'contact/update'
    * def contact_update = read('../CSDN/JsonFiles/Contact/ContactUpdate.json')
    * set contact_update.Request.User = ''
    Given request contact_update
    * print contact_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Contact_Update3
  Scenario: Contact-Update3
    #User değeri girilmeden update işlemi yapılması
    Given path 'contact/update'
    * def contact_update = read('../CSDN/JsonFiles/Contact/ContactUpdate.json')
    * set contact_update.Request.Id = ''
    Given request contact_update
    * print contact_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Contact_Update4
  Scenario: Contact-Update4
    #User değeri girilmeden update işlemi yapılması
    Given path 'contact/update'
    * def contact_update = read('../CSDN/JsonFiles/Contact/ContactUpdate.json')
    * set contact_update.Request.SourceSystem = ''
    Given request contact_update
    * print contact_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Contact_contactid_applicationid
  Scenario: Contract-{contactid}/{applicationid}
    #contact/{contactid}/{applicationid}
    Given path 'contact/816e1ef1-62bb-ec11-9840-000d3a66f6a6/b64a486f-aac4-e811-a978-000d3ab50338'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content.Firstname == '#notnull'