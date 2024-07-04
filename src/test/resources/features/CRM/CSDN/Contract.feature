Feature: CSDN-Contract

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Contract_Approve1
  Scenario: Contract-Approve1
    #Tüm değerler girilerek approve işlemi yapılması
    Given path 'contract/approve'
    * def contract_approve = read('../CSDN/JsonFiles/Contract/ContractApprove.json')
    Given request contract_approve
    * print contract_approve
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.Id == '#notnull'


  @Contract_Approve2
  Scenario: Contract-Approve2
    #ContractId değeri girilmeden approve işlemi yapılması
    Given path 'contract/approve'
    * def contract_approve = read('../CSDN/JsonFiles/Contract/ContractApprove.json')
    * set contract_approve.Request.ContractId = ''
    Given request contract_approve
    * print contract_approve
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Contract_Approve3
  Scenario: Contract-Approve3
    #CustomerId değeri girilmeden approve işlemi yapılması
    Given path 'contract/approve'
    * def contract_approve = read('../CSDN/JsonFiles/Contract/ContractApprove.json')
    * set contract_approve.Request.CustomerId = ''
    Given request contract_approve
    * print contract_approve
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Contract_Approve4
  Scenario: Contract-Approve4
    #ApplicationId değeri girilmeden approve işlemi yapılması
    Given path 'contract/approve'
    * def contract_approve = read('../CSDN/JsonFiles/Contract/ContractApprove.json')
    * set contract_approve.Request.ApplicationId = ''
    Given request contract_approve
    * print contract_approve
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Contract_Application1
  Scenario: Contract-Application1
    #Tüm değerler girilerek send yapılması
    Given path 'contract/applicationcontract'
    * def contract_applicationcontract = read('../CSDN/JsonFiles/Contract/ContractApplication.json')
    Given request contract_applicationcontract
    * print contract_applicationcontract
    When method POST
    Then status 200
    * print response
    * match response.Data.Content[0].ContractId == '#notnull'


  @Contract_Id
  Scenario: Contract-Id
    #contract/{id}
    Given path 'contract/e8f7a0a8-e14d-ec11-8c62-000d3ab5a8eb'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content.Data.Id == '#notnull'


  @Contract_GetAllContractData
  Scenario: Contract-GetAllContractData
    #contract/getallcontractdata
    Given path 'contract/getallcontractdata'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content[0].Title == '#notnull'


  @Contract_GetContractData_Title
  Scenario: Contract-getcontractdata?title={title}
    #contract/getcontractdata?title={title}
    Given path 'contract/getcontractdata'
    * param title = 'ConnecTruck Mobil Uygulama Taahhütnamesi'
    * request
    When method get
    Then status 200
    * print response
    * match response.Data.Content[0].Title == '#notnull'