Feature: Campaign-GetCampaignList_BSSModel

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignList_BSSModel1
  Scenario: Tum degerler girilerek send işlemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.CampaignList[0].Id == '#notnull'
    * match response.CampaignList[0].Name == 'Opsiyon Test Kampanyası'
    * match response.Success == true


  @GetCampaignList_BSSModel2
  Scenario: Yanlis veri tipinde CustomerTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.CustomerTypeCode = 'test'
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSSModel3
  Scenario: Yanlis veri tipinde ProcessTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.ProcessTypeCode = 'test'
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSSModel4
  Scenario: CrmCustomerId degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.CrmCustomerId = ''
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.CampaignList[0].Id == '#notnull'
    * match response.CampaignList[0].Name == 'Opsiyon Test Kampanyası'
    * match response.Success == true


  @GetCampaignList_BSSModel5
  Scenario: CustomerTypeCode degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.CrmCustomerId = ''
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.CampaignList[0].Id == '#notnull'
    * match response.CampaignList[0].Name == 'Opsiyon Test Kampanyası'
    * match response.Success == true


  @GetCampaignList_BSSModel6
  Scenario: PaymentTypeCode degeri bos birakilarak send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.PaymentTypeCode = ''
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Geçerli Kampanyaları Yükleme ve Önfiltreleme İşlemleri çalışırken hata meydana geldi : Passed value should be of type System.String. Actual Type: System.DBNull '
    * match response.Success == false


  @GetCampaignList_BSSModel7
  Scenario: PaymentTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * remove bssModel.Request.PaymentTypeCode
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSSModel8
  Scenario: Yanlis veri tipinde PaymentTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.PaymentTypeCode = [test,0]
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Message == 'Geçerli Kampanyaları Yükleme ve Önfiltreleme İşlemleri çalışırken hata meydana geldi : Passed value should be a valid option value '
    * match response.Success == false


  @GetCampaignList_BSSModel9
  Scenario: SalesTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * remove bssModel.Request.SalesTypeCode
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSSModel10
  Scenario: Yanlis veri tipinde SalesTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.SalesTypeCode = [test,5923]
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Message == 'Geçerli Kampanyaları Yükleme ve Önfiltreleme İşlemleri çalışırken hata meydana geldi : Passed value should be a valid option value '
    * match response.Success == false


  @GetCampaignList_BSSModel11
  Scenario: SalesTypeCode degeri bos birakilarak send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssModel = read('../Campaign/JsonFiles/GetCampaignList_BSSModel.json')
    * set bssModel.Request.SalesTypeCode = ''
    Given request bssModel
    * print bssModel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Geçerli Kampanyaları Yükleme ve Önfiltreleme İşlemleri çalışırken hata meydana geldi : Passed value should be of type System.String. Actual Type: System.DBNull '
    * match response.Success == false