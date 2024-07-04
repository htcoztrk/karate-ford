Feature: Campaign-GetKocFamilyCampaignUsageList

  Background:
    * header Authorization = 'Basic a29jZmFtaWx5OmNybTEyMw=='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'



  @GetKocFamilyCampaignUsageList1
  Scenario: Tum degerler girilerek send islemi yapilmasi
    Given path 'GetKocFamilyCampaignUsageList'
    * def getKocFamilyCampaignUsageList = read('../Campaign/JsonFiles/GetKocFamilyCampaignUsageList.json')
    Given request getKocFamilyCampaignUsageList
    * print getKocFamilyCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.Success == true

  @GetKocFamilyCampaignUsageList2
  Scenario: StartDate degeri girilmeden send islemi yapilmasi
    Given path 'GetKocFamilyCampaignUsageList'
    * def getKocFamilyCampaignUsageList = read('../Campaign/JsonFiles/GetKocFamilyCampaignUsageList.json')
    * set getKocFamilyCampaignUsageList.StartDate = ''
    Given request getKocFamilyCampaignUsageList
    * print getKocFamilyCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.Message == 'System.ArgumentNullException: Eksik parametre : Başlanıç veya Bitiş Tarihi dolu olmalıdır!\r\nParameter name: request\r\n   at Rms.Campaign.Business.Core.Engine.Extensions.KocAilemUsageExtensions.GetKocFamilyCampaignUsages(XrmSet`1 self, GetKocFamilyCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetKocFamilyCampaignUsages(GetKocFamilyCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetKocFamilyCampaignUsageList(PromotionEngine engine, GetKocFamilyCampaignUsageListRequestModel request)'
    * match response.Success == false


  @GetKocFamilyCampaignUsageList3
  Scenario: EndDate degeri girilmeden send islemi yapilmasi
    Given path 'GetKocFamilyCampaignUsageList'
    * def getKocFamilyCampaignUsageList = read('../Campaign/JsonFiles/GetKocFamilyCampaignUsageList.json')
    * set getKocFamilyCampaignUsageList.EndDate = ''
    Given request getKocFamilyCampaignUsageList
    * print getKocFamilyCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.Message == 'System.ArgumentNullException: Eksik parametre : Başlanıç veya Bitiş Tarihi dolu olmalıdır!\r\nParameter name: request\r\n   at Rms.Campaign.Business.Core.Engine.Extensions.KocAilemUsageExtensions.GetKocFamilyCampaignUsages(XrmSet`1 self, GetKocFamilyCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetKocFamilyCampaignUsages(GetKocFamilyCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetKocFamilyCampaignUsageList(PromotionEngine engine, GetKocFamilyCampaignUsageListRequestModel request)'
    * match response.Success == false


  @GetKocFamilyCampaignUsageList4
  Scenario: StartDate ve EndDate degeri girilmeden send islemi yapilmasi
    Given path 'GetKocFamilyCampaignUsageList'
    * def getKocFamilyCampaignUsageList = read('../Campaign/JsonFiles/GetKocFamilyCampaignUsageList.json')
    * set getKocFamilyCampaignUsageList.StartDate = ''
    * set getKocFamilyCampaignUsageList.EndDate = ''
    Given request getKocFamilyCampaignUsageList
    * print getKocFamilyCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.Message == 'System.ArgumentNullException: Eksik parametre : Başlanıç veya Bitiş Tarihi dolu olmalıdır!\r\nParameter name: request\r\n   at Rms.Campaign.Business.Core.Engine.Extensions.KocAilemUsageExtensions.GetKocFamilyCampaignUsages(XrmSet`1 self, GetKocFamilyCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetKocFamilyCampaignUsages(GetKocFamilyCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetKocFamilyCampaignUsageList(PromotionEngine engine, GetKocFamilyCampaignUsageListRequestModel request)'
    * match response.Success == false