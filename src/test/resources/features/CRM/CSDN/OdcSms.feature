Feature: CSDN-Odc

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Odc_Sms1
  Scenario: Odc-Sms1
    #Tüm değerler girilerek send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Odc_Sms2
  Scenario: Odc-Sms2
    #Subject değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.Subject = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Odc_Sms3
  Scenario: Odc-Sms3
    #Description değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.Description = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Odc_Sms4
  Scenario: Odc-Sms4
    #From değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.From = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Odc_Sms5
  Scenario: Odc-Sms5
    #1.TypeCode değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.To[0].TypeCode = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Odc_Sms6
  Scenario: Odc-Sms6
    #1.Id değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.To[0].Id = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Odc_Sms7
  Scenario: Odc-Sms7
    #2.TypeCode değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.To[1].TypeCode = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Odc_Sms8
  Scenario: Odc-Sms8
    #2.Id değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.To[1].Id = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Odc_Sms9
  Scenario: Odc-Sms9
    #CheckBlackList değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.CheckBlackList = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ExceptionList[0].Message == 'Parametre değeri boş olamaz.'


  @Odc_Sms10
  Scenario: Odc-Sms10
    #SourceSystem değeri girilmeden send işlemi yapılması
    Given path '/sms'
    * def odc_sms = read('../CSDN/JsonFiles/Odc/OdcSms.json')
    * set odc_sms.Request.SourceSystem = ''
    Given request odc_sms
    * print odc_sms
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'