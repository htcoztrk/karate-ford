Feature: CSDN-Security

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Security_Disable1
  Scenario: Security-Disable1
    #Tüm değerler girilerek disable işlemi yapılması
    Given path 'security/roles/disable'
    * def security_disable = read('../CSDN/JsonFiles/Security/SecurityDisable.json')
    Given request security_disable
    * print security_disable
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsDisabled == true


  @Security_Disable2
  Scenario: Security-Disable2
    #Id değeri girilmeden disable işlemi yapılması
    Given path 'security/roles/disable'
    * def security_disable = read('../CSDN/JsonFiles/Security/SecurityDisable.json')
    * set security_disable.Request.Id = ''
    Given request security_disable
    * print security_disable
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == "Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz."


  @Security_Disable3
  Scenario: Security-Disable3
    #Geçersiz Id değeri girilerek disable işlemi yapılması
    Given path 'security/roles/disable'
    * def security_disable = read('../CSDN/JsonFiles/Security/SecurityDisable.json')
    * set security_disable.Request.Id = 'abc'
    Given request security_disable
    * print security_disable
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == "Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz."


  @Security_UserId_ApplicationId_Flag
  Scenario: Security - {userid}/{applicationid}/{flag}
    #{userid}/{applicationid}/{flag}
    Given path 'security/roles/d73c7676-627f-ec11-8d21-000d3a659a5e/b64a486f-aac4-e811-a978-000d3ab50338/false'
    * request
    When method get
    Then status 200
    * print response
    * match response.TraceData[0].Name == '#notnull'