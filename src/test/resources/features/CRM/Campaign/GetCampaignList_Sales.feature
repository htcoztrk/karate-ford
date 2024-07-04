Feature: Campaign-GetCampaignListSales

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignList_Sales1
  Scenario: Tum degerler girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sales = read('../Campaign/JsonFiles/GetCampaignList_Sales.json')
    Given request sales
    * print sales
    When method POST
    Then status 200
    * print response
    * match response.CampaignList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_Sales2
  Scenario: Sales parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sales = read('../Campaign/JsonFiles/GetCampaignList_Sales.json')
    * remove sales.Request.Sales
    Given request sales
    * print sales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_Sales3
  Scenario: ProcessTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sales = read('../Campaign/JsonFiles/GetCampaignList_Sales.json')
    * remove sales.Request.ProcessTypeCode
    Given request sales
    * print sales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_Sales4
  Scenario: deneme
    Given path 'GetCampaignList'
    * def sales = read('../Campaign/JsonFiles/GetCampaignList_Sales.json')
    * remove sales.Request.SourceTypeCode
    Given request sales
    * print sales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_Sales5
  Scenario: Yanlis veri tipinde CrmCustomerId degeri ile send islemi yapma
    Given path 'GetCampaignList'
    * def sales = read('../Campaign/JsonFiles/GetCampaignList_Sales.json')
    * set sales.Request.CrmCustomerId = 'CDB912D1-9BCF-EB11-BACC-'
    Given request sales
    * print sales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Guid should contain 32 digits with 4 dashes (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx). '
    * match response.Success == false


  @GetCampaignList_Sales6
  Scenario: CustomerTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sales = read('../Campaign/JsonFiles/GetCampaignList_Sales.json')
    * remove sales.Request.CustomerTypeCode
    Given request sales
    * print sales
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false