Feature: CSDN-Vehicle

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  #Scenario: Vehicle-Create1
    #Tüm değerler girilerek create işlemi yapılması
    #Given path 'vehicle/create'
    #* def vehicle_create = read('../CSDN/JsonFiles/Vehicle/VehicleCreate.json')
    #* set vehicle_create.Request.VehicleList[0].VehicleId = '1c2ee4e1-2e41-ec11-8c62-000d3ab877b6'
    #Given request vehicle_create
    #* print vehicle_create
    #When method POST
    #Then status 200
    #* print response
    #* match response.Data.Content.IsSuccess == true


  @Vehicle_Create2
  Scenario: Vehicle-Create2
    #RelationId değeri girilmeden create işlemi yapılması
    Given path 'vehicle/create'
    * def vehicle_create = read('../CSDN/JsonFiles/Vehicle/VehicleCreate.json')
    * set vehicle_create.Request.RelationId = ''
    Given request vehicle_create
    * print vehicle_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_Create3
  Scenario: Vehicle-Create3
    #1.VehicleId değeri girilmeden create işlemi yapılması
    Given path 'vehicle/create'
    * def vehicle_create = read('../CSDN/JsonFiles/Vehicle/VehicleCreate.json')
    * set vehicle_create.Request.VehicleList[0].VehicleId = ''
    Given request vehicle_create
    * print vehicle_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_Create4
  Scenario: Vehicle-Create4
    #2.VehicleId değeri girilmeden create işlemi yapılması
    Given path 'vehicle/create'
    * def vehicle_create = read('../CSDN/JsonFiles/Vehicle/VehicleCreate.json')
    * set vehicle_create.Request.VehicleList[1].VehicleId = ''
    Given request vehicle_create
    * print vehicle_create
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_Delete1
  Scenario: Vehicle-Delete1
    #Tüm değerler girilerek delete işlemi yapılması
    #Silme işleminden önce kayıt oluşturuluyor.
    Given path 'vehicle/create'
    * def vehicle_create = read('../CSDN/JsonFiles/Vehicle/VehicleCreate.json')
    Given request vehicle_create
    * print vehicle_create
    When method POST
    Then status 200
    * print response
    * def vehicle_test = response.Data.Content
    * if (vehicle_test == null) karate.call('x.feature')
    * if (vehicle_test != null) karate.call('y.feature')


  @Vehicle_Delete2
  Scenario: Vehicle-Delete2
    #RelationId değeri girilmeden delete işlemi yapılması
    Given path 'vehicle/delete'
    * def vehicle_delete = read('../CSDN/JsonFiles/Vehicle/VehicleDelete.json')
    * set vehicle_delete.Request.RelationId = ''
    Given request vehicle_delete
    * print vehicle_delete
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_Delete3
  Scenario: Vehicle-Delete3
    #VehicleId değeri girilmeden delete işlemi yapılması
    Given path 'vehicle/delete'
    * def vehicle_delete = read('../CSDN/JsonFiles/Vehicle/VehicleDelete.json')
    * set vehicle_delete.Request.VehicleId = ''
    Given request vehicle_delete
    * print vehicle_delete
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_WithFullAccount1
  Scenario: Vehicle-WithFullAccount1
    #Tüm değerler girilerek send edilmesi
    Given path 'vehicle/withfullaccount'
    * def vehicle_withfullaccount = read('../CSDN/JsonFiles/Vehicle/Vehicle_WithFullAccount.json')
    Given request vehicle_withfullaccount
    * print vehicle_withfullaccount
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.List[0].Account.Id == '#notnull'


  @Vehicle_WithFullAccount2
  Scenario: Vehicle-WithFullAccount2
    #ApplicationId değeri girilmeden send edilmesi
    Given path 'vehicle/withfullaccount'
    * def vehicle_withfullaccount = read('../CSDN/JsonFiles/Vehicle/Vehicle_WithFullAccount.json')
    Given request vehicle_withfullaccount
    * set vehicle_withfullaccount.Request.ApplicationId = ''
    * print vehicle_withfullaccount
    When method POST
    Then status 200
    * print response.ValidationList[0].Message = 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_WithFullAccount3
  Scenario: Vehicle-WithFullAccount3
    #UserId değeri girilmeden send edilmesi
    Given path 'vehicle/withfullaccount'
    * def vehicle_withfullaccount = read('../CSDN/JsonFiles/Vehicle/Vehicle_WithFullAccount.json')
    Given request vehicle_withfullaccount
    * set vehicle_withfullaccount.Request.UserId = ''
    * print vehicle_withfullaccount
    When method POST
    Then status 200
    * print response.ValidationList[0].Message = 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_RelatedAccounts1
  Scenario: Vehicle-RelatedAccounts1
    #Tüm değerler girilerek send edilmesi
    Given path 'vehicle/relatedaccounts'
    * def vehicle_relatedaccounts = read('../CSDN/JsonFiles/Vehicle/Vehicle_WithFullAccount.json')
    Given request vehicle_relatedaccounts
    * print vehicle_relatedaccounts
    When method POST
    Then status 200
    * match response.Data.Content.List[0] == '#notnull'


  @Vehicle_RelatedAccounts2
  Scenario: Vehicle-RelatedAccounts2
    #UserId değeri girilmeden send işlemi yapılması
    Given path 'vehicle/relatedaccounts'
    * def vehicle_relatedaccounts = read('../CSDN/JsonFiles/Vehicle/Vehicle_WithFullAccount.json')
    Given request vehicle_relatedaccounts
    * set vehicle_relatedaccounts.Request.UserId = ''
    * print vehicle_relatedaccounts
    When method POST
    Then status 200
    * print response.ValidationList[0].Message = 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Vehicle_RelatedAccounts3
  Scenario: Vehicle-RelatedAccounts3
    #ApplicationId değeri girilmeden send işlemi yapılması
    Given path 'vehicle/relatedaccounts'
    * def vehicle_relatedaccounts = read('../CSDN/JsonFiles/Vehicle/Vehicle_WithFullAccount.json')
    Given request vehicle_relatedaccounts
    * set vehicle_relatedaccounts.Request.ApplicationId = ''
    * print vehicle_relatedaccounts
    When method POST
    Then status 200
    * print response.ValidationList[0].Message = 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'
