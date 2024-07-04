Feature: CSDN-Users

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @User_PersonnelOfAccount1
  Scenario: User-PersonnelOfAccount1
    #Tüm değerler(kullanıcı yetkisi bulunan) girilerek send işlemi yapılması
    Given path 'users/personnelofaccount'
    * def users_personnelofaccount = read('../CSDN/JsonFiles/Users/UsersPersonnelOfAccount.json')
    Given request users_personnelofaccount
    * print users_personnelofaccount
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Profiles == '#notnull'


  @User_PersonnelOfAccount2
  Scenario: User-PersonnelOfAccount2
    #Tüm değerler(kullanıcı yetkisi bulunmayan) girilerek send işlemi yapılması
    Given path 'users/personnelofaccount'
    * def users_personnelofaccount = read('../CSDN/JsonFiles/Users/UsersPersonnelOfAccount.json')
    * set users_personnelofaccount.Request.UserId = '1e83e0c5-f8bb-eb11-bacc-000d3ab78e64'
    Given request users_personnelofaccount
    * print users_personnelofaccount
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'İşlem yapılan kullanıcının yetkisi bulunmamaktadır.'


  @User_PersonnelOfAccount3
  Scenario: User-PersonnelOfAccount3
    #UserId değeri girilmeden send işlemi yapılması
    Given path 'users/personnelofaccount'
    * def users_personnelofaccount = read('../CSDN/JsonFiles/Users/UsersPersonnelOfAccount.json')
    * set users_personnelofaccount.Request.UserId = ''
    Given request users_personnelofaccount
    * print users_personnelofaccount
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'İşlem yapılan kullanıcının yetkisi bulunmamaktadır.'


  @User_PersonnelOfAccount4
  Scenario: User-PersonnelOfAccount4
    #AccountId değeri girilmeden send işlemi yapılması
    Given path 'users/personnelofaccount'
    * def users_personnelofaccount = read('../CSDN/JsonFiles/Users/UsersPersonnelOfAccount.json')
    * set users_personnelofaccount.Request.AccountId = ''
    Given request users_personnelofaccount
    * print users_personnelofaccount
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @User_PersonnelOfAccount5
  Scenario: User-PersonnelOfAccount5
    #ApplicationId değeri girilmeden send işlemi yapılması
    Given path 'users/personnelofaccount'
    * def users_personnelofaccount = read('../CSDN/JsonFiles/Users/UsersPersonnelOfAccount.json')
    * set users_personnelofaccount.Request.ApplicationId = ''
    Given request users_personnelofaccount
    * print users_personnelofaccount
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'İşlem yapılan kullanıcının yetkisi bulunmamaktadır.'


  @User_username
  Scenario: User-users/{username}
    #users/{username}
    Given path 'users/test'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content.CustomerCountry.Id == '#notnull'
    * match response.Data.Content.ParentOrganization.Name == '#notnull'