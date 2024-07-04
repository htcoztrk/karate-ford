Feature: Campaign-GetCampaignList_SYS

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignList_SYS1
  Scenario: Tum degerler girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.TotalDiscountAmount == '#notnull'
    * match response.InvalidCampaignModelList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_SYS2
  Scenario: ProcessTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.ProcessTypeCode
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS3
  Scenario: DoNotApply parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.DoNotApply
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS4
  Scenario: UnitCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.UnitCode
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS5
  Scenario: Yanlis veri tipinde CardTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.CardTypeCode = 'test'
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Input string was not in a correct format. '
    * match response.Success == false


  @GetCampaignList_SYS6
  Scenario: CardNumber degeri bos birakilarak send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.CardNumber = ''
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.TotalDiscountAmount == '#notnull'
    * match response.InvalidCampaignModelList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_SYS7
  Scenario: KocAilemNumber degeri bos birakilarak send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.KocAilemNumber = ''
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.TotalDiscountAmount == '#notnull'
    * match response.InvalidCampaignModelList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_SYS8
  Scenario: UserName parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.UnitCode
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS9
  Scenario: CrmCustomerId degeri bos birakilarak send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.CrmCustomerId = ''
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS10
  Scenario: ClientTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.ClientTypeCode
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS11
  Scenario: ClientTypeValue parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.ClientTypeValue
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS12
  Scenario: CrmOpportunityId degeri bos birakilarak send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.CrmOpportunityId = ''
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.TotalDiscountAmount == '#notnull'
    * match response.InvalidCampaignModelList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_SYS13
  Scenario: Tanimli aralik degeri disinda CustomerTypeCode degeri gonderilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.CustomerTypeCode = 5
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : 5\r\nParameter name: customerTypeCode '
    * match response.Success == false


  @GetCampaignList_SYS14
  Scenario: CustomerTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.CustomerTypeCode
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS15
  Scenario: CustomerTypeCode degeri bos birakilarak send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.CustomerTypeCode = ''
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS16
  Scenario: Yanlis veri tipinde WorkOrderType degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.WorkOrderType = 'test'
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Input string was not in a correct format. '
    * match response.Success == false


  @GetCampaignList_SYS17
  Scenario: Tanimli aralik degeri disinda InsuranceTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.InsuranceTypeCode = 4
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.InvalidCampaignModelList[0].Message == 'a237ffa9-b07b-ed11-81ad-0022489bd701|Ford Güvence %100 CRM Araç Hedef Liste Filtreleme İşlemi denetlemesinden geçemediği için listeye eklenmeyecek.'


  @GetCampaignList_SYS18
  Scenario: InsuranceTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * remove sys.Request.InsuranceTypeCode
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYS19
  Scenario: Tanimli aralik degeri disinda InsuranceAccountTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.InsuranceAccountTypeCode = 1
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.InvalidCampaignModelList[0].Message == 'a237ffa9-b07b-ed11-81ad-0022489bd701|Ford Güvence %100 CRM Araç Hedef Liste Filtreleme İşlemi denetlemesinden geçemediği için listeye eklenmeyecek.'


  @GetCampaignList_SYS20
  Scenario: Yanlis veri tipinde TransactionTotalAmount degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.TransactionTotalAmount = 'test'
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_SYS21
  Scenario: Yanlis veri tipinde TotalTransactionTotalAmountWithoutGuarenteedLines degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.TotalTransactionTotalAmountWithoutGuarenteedLines = 'test'
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.InvalidCampaignModelList[0].Message == 'a237ffa9-b07b-ed11-81ad-0022489bd701|Ford Güvence %100 CRM Araç Hedef Liste Filtreleme İşlemi denetlemesinden geçemediği için listeye eklenmeyecek.'


  @GetCampaignList_SYS22
  Scenario: Yanlis veri tipinde CargoCumulativeTotal degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.CargoCumulativeTotal = 'test'
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.InvalidCampaignModelList[0].Message == 'a237ffa9-b07b-ed11-81ad-0022489bd701|Ford Güvence %100 CRM Araç Hedef Liste Filtreleme İşlemi denetlemesinden geçemediği için listeye eklenmeyecek.'


  @GetCampaignList_SYS23
  Scenario: Yanlis veri tipinde SpidsPartTotal degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sys = read('../Campaign/JsonFiles/GetCampaignList_Sys.json')
    * set sys.Request.SpidsPartTotal = 'test'
    Given request sys
    * print sys
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false
