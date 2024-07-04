Feature: Campaign-GetCampaignList_BSSCrmUI

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignList_BSSCrmUI1
  Scenario: Tum degerler girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssCrmUI = read('../Campaign/JsonFiles/GetCampaignList_BSSCrmUI.json')
    Given request bssCrmUI
    * print bssCrmUI
    When method POST
    Then status 200
    * print response
    #* match response.CampaignList[0].CampaignId == '#notnull'
    #* match response.Success == true


  @GetCampaignList_BSSCrmUI2
  Scenario: CustomerTypeCode alanina gecersiz deger girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssCrmUI = read('../Campaign/JsonFiles/GetCampaignList_BSSCrmUI.json')
    * set bssCrmUI.Request.CustomerTypeCode = 3
    Given request bssCrmUI
    * print bssCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Specified argument was out of the range of valid values. '
    * match response.Success == false


  @GetCampaignList_BSSCrmUI3
  Scenario: CustomerTypeCode alanina gecersiz veri tipinde deger girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssCrmUI = read('../Campaign/JsonFiles/GetCampaignList_BSSCrmUI.json')
    * set bssCrmUI.Request.CustomerTypeCode = "test"
    Given request bssCrmUI
    * print bssCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Input string was not in a correct format. '
    * match response.Success == false


  @GetCampaignList_BSSCrmUI4
  Scenario: CustomerTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssCrmUI = read('../Campaign/JsonFiles/GetCampaignList_BSSCrmUI.json')
    * remove bssCrmUI.Request.CustomerTypeCode
    Given request bssCrmUI
    * print bssCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSSCrmUI5
  Scenario: CrmCustomerId parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssCrmUI = read('../Campaign/JsonFiles/GetCampaignList_BSSCrmUI.json')
    * remove bssCrmUI.Request.CrmCustomerId
    Given request bssCrmUI
    * print bssCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSSCrmUI6
  Scenario: ProcessTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssCrmUI = read('../Campaign/JsonFiles/GetCampaignList_BSSCrmUI.json')
    * remove bssCrmUI.Request.ProcessTypeCode
    Given request bssCrmUI
    * print bssCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSSCrmUI7
  Scenario: CrmUI parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bssCrmUI = read('../Campaign/JsonFiles/GetCampaignList_BSSCrmUI.json')
    * remove bssCrmUI.Request.CrmUI
    Given request bssCrmUI
    * print bssCrmUI
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false