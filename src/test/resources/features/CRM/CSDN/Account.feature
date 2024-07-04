Feature: CSDN-Account

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'



  @Account_Create1
  Scenario: Account-Create1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    Given request account_create
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Account_Create2
  Scenario: Account-Create2
    #SourceSystem değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.SourceSystem = ''
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Account_Create3
  Scenario: Account-Create3
    #Name değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.Name = ''
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Account_Create4
  Scenario: Account-Create4
    #CompanyTypeCode değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.CompanyTypeCode = ''
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'SourceSystemCode değeri 10 (IDA) yada 11(Ikinci El) olmadığında Customer Type Code alanı boş bırakılamaz.'


  @Account_Create5
  Scenario: Account-Create5
    #TaxOffice değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.TaxOffice = ''
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Account_Create6
  Scenario: Account-Create6
    #EmailAddress değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * remove account_create.Request.EmailAddress
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Account_Create7
  Scenario: Account-Create7
    #SourceSystem değeri 10 ve EmailAddress değeri boş iken create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.EmailAddress = ''
    * set account_create.Request.SourceSystem = 10
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'SourceSystemCode değeri 10 (IDA) olduğunda E-Mail adresi boş bırakılamaz.'


  @Account_Create8
  Scenario: Account-Create8
    #Department değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.Department = ''
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Account_Create9
  Scenario: Account-Create9
    #SourceSystem değeri 10 ve Department değeri boş iken create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.Department = ''
    * set account_create.Request.SourceSystem = 10
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Account_Create10
  Scenario: Account-Create10
    #TradeRegistrationNumber değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.TradeRegistrationNumber = ''
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Account_Create11
  Scenario: Account-Create11
    #User değeri girilmeden create işlemi yapılması
    Given path 'account/create'
    * def account_create = read('../CSDN/JsonFiles/Account/AccountCreate.json')
    * set account_create.Request.User = ''
    Given request account_create
    * print account_create
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Account_Update1
  Scenario: Account-Update1
    #Tüm değerler girilerek update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    Given request account_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Update2
  Scenario: Account-Update2
    #Id değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.Id = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Account_Update3
  Scenario: Account-Update3
    #SourceSystem değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.SourceSystem = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Account_Update4
  Scenario: Account-Update4
    #CompanyTypeCode değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.CompanyTypeCode = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'SourceSystemCode değeri 10 (IDA) yada 11(Ikinci El) olmadığında Customer Type Code alanı boş bırakılamaz.'


  @Account_Update5
  Scenario: Account-Update5
    #TaxOffice değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.TaxOffice = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Update6
  Scenario: Account-Update6
    #TaxNumber değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.TaxNumber = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Update7
  Scenario: Account-Update7
    #PhoneNumber değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * remove account_update.Request.PhoneNumber
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Update8
  Scenario: Account-Update8
    #EmailAddress değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.EmailAddress = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Email alanına geçerli bir email girilmelidir.'


  @Account_Update9
  Scenario: Account-Update9
    #TradeRegistrationNumber değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.TradeRegistrationNumber = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Update10
  Scenario: Account-Update10
    #User değeri girilmeden update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.User = ''
    Given request account_update
    * print account_update
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Account_Update11
  Scenario: Account-Update11
    #SourceSystem değeri 10 ve CompanyTypeCode değeri boş iken update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.CompanyTypeCode = ''
    * set account_update.Request.SourceSystem = 10
    Given request account_update
    * print account_update
    When method POST
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Update12
  Scenario: Account-Update12
    #SourceSystem değeri 11 ve CompanyTypeCode değeri boş iken update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.CompanyTypeCode = ''
    * set account_update.Request.SourceSystem = 11
    Given request account_update
    * print account_update
    When method POST
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Update13
  Scenario: Account-Update13
    #SourceSystem değeri 10 ve EmailAddress değeri boş iken update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.EmailAddress = ''
    * set account_update.Request.SourceSystem = 10
    Given request account_update
    * print account_update
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'SourceSystemCode değeri 10 (IDA) olduğunda E-Mail adresi boş bırakılamaz.'


  @Account_Update14
  Scenario: Account-Update14
    #SourceSystem değeri 10 ve User değeri boş iken update işlemi yapılması
    Given path 'account/update'
    * def account_update = read('../CSDN/JsonFiles/Account/AccountUpdate.json')
    * set account_update.Request.User = ''
    * set account_update.Request.SourceSystem = 10
    Given request account_update
    * print account_update
    When method POST
    * print response
    * match response.Data.Content.IsUpdated == true


  @Account_Search1
  Scenario: Account-Search1
    #Tüm değerler girilerek search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.Data.Content[0].Id == '9a566e28-81de-ed11-a7c6-0022489bd56e'


  @Account_Search2
  Scenario: Account-Search2
    #Name değeri girilmeden search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.Name = ''
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.Data.Content[0].Id == '9a566e28-81de-ed11-a7c6-0022489bd56e'


  @Account_Search3
  Scenario: Account-Search3
    #TaxNumber değeri girilmeden search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.TaxNumber = ''
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.Data.Content[0].Id == '9a566e28-81de-ed11-a7c6-0022489bd56e'


  @Account_Search4
  Scenario: Account-Search4
    #PhoneNumber değeri girilmeden search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.PhoneNumber = ''
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.Data.Content[0].Id == '9a566e28-81de-ed11-a7c6-0022489bd56e'


  @Account_Search5
  Scenario: Account-Search5
    #User değeri girilmeden search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.User = ''
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Account_Search6
  Scenario: Account-Search6
    #AccountNumber değeri girilmeden search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.AccountNumber = ''
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.Data.Content[0].Id == '9a566e28-81de-ed11-a7c6-0022489bd56e'


  @Account_Search7
  Scenario: Account-Search7
    #EmailAddress değeri girilmeden search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.EmailAddress = ''
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.Data.Content[0].Id == '9a566e28-81de-ed11-a7c6-0022489bd56e'


  @Account_Search8
  Scenario: Account-Search8
    #Name parametresine 2 karakterden az değer girilerek search yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.Name = 'a'
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Parametre en az 2 karakter olmalıdır.'


  @Account_Search9
  Scenario: Account-Search9
    #User değeri girilip diğer tüm alanlar boş şekilde search işlemi yapılması
    Given path 'account/search'
    * def account_search = read('../CSDN/JsonFiles/Account/AccountSearch.json')
    * set account_search.Request.Name = ''
    * set account_search.Request.TaxNumber = ''
    * set account_search.Request.PhoneNumber = ''
    * set account_search.Request.AccountId = ''
    * set account_search.Request.AccountNumber = ''
    * set account_search.Request.EmailAddress = ''
    Given request account_search
    * print account_search
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Alanların hepsi aynı anda boş olamaz.'


  @Account_CheckFirmVkn1
  Scenario: Account-CheckFirmVkn1
    #Aynı çatılara ait VKN değeri girilerek check işlemi yapılması
    Given path 'account/checkfirmvkn'
    * def account_checkFirm = read('../CSDN/JsonFiles/Account/AccountCheckFirmVkn.json')
    * set account_checkFirm.Request.FirmVkn = '10800363'
    * set account_checkFirm.Request.MainFirmVkn = '10800363'
    Given request account_checkFirm
    * print account_checkFirm
    When method POST
    * print response
    * match response.Data.Content.IsMatch == true


  @Account_CheckFirmVkn2
  Scenario: Account-CheckFirmVkn2
    #FirmVkn değeri girilmeden check işlemi yapılması
    Given path 'account/checkfirmvkn'
    * def account_checkFirm = read('../CSDN/JsonFiles/Account/AccountCheckFirmVkn.json')
    * set account_checkFirm.Request.FirmVkn = ''
    Given request account_checkFirm
    * print account_checkFirm
    When method POST
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Account_CheckFirmVkn3
  Scenario: Account-CheckFirmVkn3
    #MainFirmVkn değeri girilmeden check işlemi yapılması
    Given path 'account/checkfirmvkn'
    * def account_checkFirm = read('../CSDN/JsonFiles/Account/AccountCheckFirmVkn.json')
    * set account_checkFirm.Request.MainFirmVkn = ''
    Given request account_checkFirm
    * print account_checkFirm
    When method POST
    * print response
    * match response.Data.Content.IsMatch == true


  @Account_CheckFirmVkn4
  Scenario: Account-CheckFirmVkn4
    #Farklı çatılara ait VKN değeri girilerek check işlemi yapılması
    Given path 'account/checkfirmvkn'
    * def account_checkFirm = read('../CSDN/JsonFiles/Account/AccountCheckFirmVkn.json')
    * set account_checkFirm.Request.FirmVkn = '10800363'
    * set account_checkFirm.Request.MainFirmVkn = '320039843'
    Given request account_checkFirm
    * print account_checkFirm
    When method POST
    * print response
    * match response.Data.Content.IsMatch == false
