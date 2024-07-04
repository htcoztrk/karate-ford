Feature: CSDN-Email

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Email1
  Scenario: Email1
    #Ek yüklemeden Email gönderme işlemi
    Given path 'email'
    * def email = read('../CSDN/JsonFiles/Email/Email.json')
    Given request email
    * print email
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Email2
  Scenario: Email2
    #Owner değeri girilmeden Email gönderme işlemi
    Given path 'email'
    * def email = read('../CSDN/JsonFiles/Email/Email.json')
    * set email.Request.Owner = ''
    Given request email
    * print email
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Email3
  Scenario: Email3
    #(From)TypeCode değeri girilmeden Email gönderme işlemi
    Given path 'email'
    * def email = read('../CSDN/JsonFiles/Email/Email.json')
    * set email.Request.From.TypeCode = ''
    Given request email
    * print email
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Email4
  Scenario: Email4
    #(From)Id değeri girilmeden Email gönderme işlemi
    Given path 'email'
    * def email = read('../CSDN/JsonFiles/Email/Email.json')
    * set email.Request.From.Id = ''
    Given request email
    * print email
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Email5
  Scenario: Email5
    #Subject değeri girilmeden Email gönderme işlemi
    Given path 'email'
    * def email = read('../CSDN/JsonFiles/Email/Email.json')
    * set email.Request.Subject = ''
    Given request email
    * print email
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Email6
  Scenario: Email6
    #Description değeri girilmeden Email gönderme işlemi
    Given path 'email'
    * def email = read('../CSDN/JsonFiles/Email/Email.json')
    * set email.Request.Description = ''
    Given request email
    * print email
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Email7
  Scenario: Email7
    #SourceSystem değeri girilmeden Email gönderme işlemi
    Given path 'email'
    * def email = read('../CSDN/JsonFiles/Email/Email.json')
    * set email.Request.SourceSystem = ''
    Given request email
    * print email
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'