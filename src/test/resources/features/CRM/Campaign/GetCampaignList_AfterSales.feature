Feature: Campaign-GetCampaignList_AfterSales

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignList_AfterSales1
  Scenario: Tum degerler girilerek send işlemi yapilmasi
    Given path 'GetCampaignList'
    * def afterSales = read('../Campaign/JsonFiles/GetCampaignList_AfterSales.json')
    Given request afterSales
    * print afterSales
    When method POST
    Then status 200
    * print response
    * match response.CampaignList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_AfterSales2
  Scenario: Yanlis veri tipinde ProcessTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def afterSales = read('../Campaign/JsonFiles/GetCampaignList_AfterSales.json')
    * set afterSales.Request.ProcessTypeCode = 'test'
    Given request afterSales
    * print afterSales
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_AfterSales3
  Scenario: CrmCustomerId degeri bos gonderilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def afterSales = read('../Campaign/JsonFiles/GetCampaignList_AfterSales.json')
    * set afterSales.Request.CrmCustomerId = ''
    Given request afterSales
    * print afterSales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_AfterSales4
  Scenario: Yanlis veri tipinde CrmCustomerId degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def afterSales = read('../Campaign/JsonFiles/GetCampaignList_AfterSales.json')
    * set afterSales.Request.CrmCustomerId = '836bf27e-e65d-ea11-a811-'
    Given request afterSales
    * print afterSales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Guid should contain 32 digits with 4 dashes (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx). '
    * match response.Success == false


  @GetCampaignList_AfterSales5
  Scenario: VinNumber degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignList'
    * def afterSales = read('../Campaign/JsonFiles/GetCampaignList_AfterSales.json')
    * set afterSales.Request.VinNumber = ''
    Given request afterSales
    * print afterSales
    When method POST
    Then status 200
    * print response
    * match response.CampaignList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_AfterSales6
  Scenario: PtvlId parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def afterSales = read('../Campaign/JsonFiles/GetCampaignList_AfterSales.json')
    * remove afterSales.Request.PtvlId
    Given request afterSales
    * print afterSales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false