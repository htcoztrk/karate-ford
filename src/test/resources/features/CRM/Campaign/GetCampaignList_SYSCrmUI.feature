Feature: Campaign-GetCampaignList_SYSCrmUI

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignList_SYSCrmUI1
  Scenario: Tum degerler girilerek send işlemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.CampaignList[0].CampaignId == '#notnull'
    * match response.Success == true


  @GetCampaignList_SYSCrmUI2
  Scenario: CardTypeCode alanina string deger girerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    * set sysCrmUI.Request.CardTypeCode = 'test'
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Input string was not in a correct format. '
    * match response.Success == false


  @GetCampaignList_SYSCrmUI3
  Scenario: PtvlId parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    * remove sysCrmUI.Request.PtvlId
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Api tanımı içerisinde araç sorgusu bulunamadı! | Api tanımı Satış Sonrası (BssCrmUI) Entegrasyon API Tanımı '
    * match response.Success == false


  @GetCampaignList_SYSCrmUI4
  Scenario: CustomerTypeCode alanina geçersiz deger girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    * set sysCrmUI.Request.CustomerTypeCode = 3
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : 3\r\nParameter name: customerTypeCode '
    * match response.Success == false


  @GetCampaignList_SYSCrmUI5
  Scenario: CustomerTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    * remove sysCrmUI.Request.CustomerTypeCode
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYSCrmUI6
  Scenario: CrmCustomerId degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    * set sysCrmUI.Request.CrmCustomerId = ''
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYSCrmUI7
  Scenario: ProcessTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    * remove sysCrmUI.Request.ProcessTypeCode
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_SYSCrmUI8
  Scenario: CrmUI parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def sysCrmUI = read('../Campaign/JsonFiles/GetCampaignList_SYSCrmUI.json')
    * remove sysCrmUI.Request.CrmUI
    Given request sysCrmUI
    * print sysCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false