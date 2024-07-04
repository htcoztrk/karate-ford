Feature: CSDN-Gdpr

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Gdpr_PermissionCreate1
  Scenario: Gdpr-PermissionCreate1
    #Tüm değerler create işlemi yapılması
    Given path 'gdpr/permissioncreate'
    * def gdpr_permissioncreate = read('../CSDN/JsonFiles/Gdpr/GdprPermissionCreate.json')
    Given request gdpr_permissioncreate
    * print gdpr_permissioncreate
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Gdpr_PermissionCreate2
  Scenario: Gdpr-PermissionCreate2
    #ContactId değeri girilmeden create işlemi yapılması
    Given path 'gdpr/permissioncreate'
    * def gdpr_permissioncreate = read('../CSDN/JsonFiles/Gdpr/GdprPermissionCreate.json')
    * set gdpr_permissioncreate.Request.ContactId = ''
    Given request gdpr_permissioncreate
    * print gdpr_permissioncreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Gdpr_PermissionCreate3
  Scenario: Gdpr-PermissionCreate3
    #GDPRPermissionTypeCode değeri girilmeden create işlemi yapılması
    Given path 'gdpr/permissioncreate'
    * def gdpr_permissioncreate = read('../CSDN/JsonFiles/Gdpr/GdprPermissionCreate.json')
    * set gdpr_permissioncreate.Request.GDPRPermissionTypeCode = ''
    Given request gdpr_permissioncreate
    * print gdpr_permissioncreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Gdpr_PermissionCreate4
  Scenario: Gdpr-PermissionCreate4
    #SourceSystemCode değeri girilmeden create işlemi yapılması
    Given path 'gdpr/permissioncreate'
    * def gdpr_permissioncreate = read('../CSDN/JsonFiles/Gdpr/GdprPermissionCreate.json')
    * set gdpr_permissioncreate.Request.SourceSystemCode = ''
    Given request gdpr_permissioncreate
    * print gdpr_permissioncreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Gdpr_PermissionCreate5
  Scenario: Gdpr-PermissionCreate5
    #UserId değeri girilmeden create işlemi yapılması
    Given path 'gdpr/permissioncreate'
    * def gdpr_permissioncreate = read('../CSDN/JsonFiles/Gdpr/GdprPermissionCreate.json')
    * set gdpr_permissioncreate.Request.UserId = ''
    Given request gdpr_permissioncreate
    * print gdpr_permissioncreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Gdpr_PermissionCreate6
  Scenario: Gdpr-PermissionCreate6
    #GDPRPermissionTypeCode kısmına geçersiz değer girilerek create işlemi yapılması
    Given path 'gdpr/permissioncreate'
    * def gdpr_permissioncreate = read('../CSDN/JsonFiles/Gdpr/GdprPermissionCreate.json')
    * set gdpr_permissioncreate.Request.GDPRPermissionTypeCode = '0'
    Given request gdpr_permissioncreate
    * print gdpr_permissioncreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Gdpr_PermissionCreate7
  Scenario: Gdpr-PermissionCreate7
    #SourceSystemCode kısmına geçersiz değer girilerek create işlemi yapılması
    Given path 'gdpr/permissioncreate'
    * def gdpr_permissioncreate = read('../CSDN/JsonFiles/Gdpr/GdprPermissionCreate.json')
    * set gdpr_permissioncreate.Request.SourceSystemCode = '25'
    Given request gdpr_permissioncreate
    * print gdpr_permissioncreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Gdpr_Search1
  Scenario: Gdpr-Search1
    #Tüm değerler girilerek search işlemi yapılması
    Given path 'gdpr/search'
    * def gdpr_search = read('../CSDN/JsonFiles/Gdpr/GdprSearch.json')
  #  * set gdpr_search.Request.SourceSystemCode = '25'
    Given request gdpr_search
    * print gdpr_search
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.FirstName == '#notnull'


  @Gdpr_Search2
  Scenario: Gdpr-Search2
    #GDPRRequestId değeri girilmeden search işlemi yapılması
    Given path 'gdpr/search'
    * def gdpr_search = read('../CSDN/JsonFiles/Gdpr/GdprSearch.json')
    * set gdpr_search.Request.GDPRRequestId = ''
    Given request gdpr_search
    * print gdpr_search
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Gdpr_Search3
  Scenario: Gdpr-Search3
    #KVKK İzin Talebi Onaylanmış GDPRRequestId ile search işlemi yapma
    Given path 'gdpr/search'
    * def gdpr_search = read('../CSDN/JsonFiles/Gdpr/GdprSearch.json')
    * set gdpr_search.Request.GDPRRequestId = '4f12a075-fcf2-ed11-8849-0022489bd56e'
    Given request gdpr_search
    * print gdpr_search
    When method POST
    Then status 200
    * print response
    * match response.ExceptionList[0].Message == 'KVKK talebi zaten onaylanmış. Yeniden onaylama işlemi yapılamaz.'
