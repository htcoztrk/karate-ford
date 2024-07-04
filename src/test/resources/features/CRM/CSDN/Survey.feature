Feature: CSDN-Survey

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Survey_RequestCreate1
  Scenario: Survey-RequestCreate1
    #Tüm değerler girilerek create işlemi yapılması
    Given path 'survey/requestcreate'
    * def survey_requestcreate = read('../CSDN/JsonFiles/Survey/SurveyRequestCreate.json')
    Given request survey_requestcreate
    * print survey_requestcreate
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.RequestId == '#notnull'


  @Survey_RequestCreate2
  Scenario: Survey-RequestCreate2
    #ContactId değeri girilmeden create işlemi yapılması
    Given path 'survey/requestcreate'
    * def survey_requestcreate = read('../CSDN/JsonFiles/Survey/SurveyRequestCreate.json')
    * set survey_requestcreate.Request.ContactId = ''
    Given request survey_requestcreate
    * print survey_requestcreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Survey_RequestCreate3
  Scenario: Survey-RequestCreate3
    #SurveyTypeCode değeri girilmeden create işlemi yapılması
    Given path 'survey/requestcreate'
    * def survey_requestcreate = read('../CSDN/JsonFiles/Survey/SurveyRequestCreate.json')
    * set survey_requestcreate.Request.SurveyTypeCode = ''
    Given request survey_requestcreate
    * print survey_requestcreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Survey_RequestCreate4
  Scenario: Survey-RequestCreate4
    #SourceSystemId değeri girilmeden create işlemi yapılması
    Given path 'survey/requestcreate'
    * def survey_requestcreate = read('../CSDN/JsonFiles/Survey/SurveyRequestCreate.json')
    * set survey_requestcreate.Request.SourceSystemId = ''
    Given request survey_requestcreate
    * print survey_requestcreate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'