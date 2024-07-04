Feature: Campaign-GetCampaignUsageList

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignUsageList1
  Scenario: Tum degerler girilerek kampanya kullanim ve detaylarinin listelenmesi islemi
    Given path 'GetCampaignUsageList'
    * def getCampaignUsageList = read('../Campaign/JsonFiles/GetCampaignUsageList.json')
    Given request getCampaignUsageList
    * print getCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.CampaignUsageList[0].CrmVehicleId == '#notnull'
    * match response.CampaignUsageList[0].CustomerTypeCode == 2
    * match response.Success == true


  @GetCampaignUsageList2
  Scenario: Sadece StartDate ve EndDate degerleri girilerek kampanya kullanim ve detaylarinin listelenmesi
    Given path 'GetCampaignUsageList'
    * def getCampaignUsageList = read('../Campaign/JsonFiles/GetCampaignUsageList.json')
    * set getCampaignUsageList.TranId = ''
    * set getCampaignUsageList.CampaignCode = ''
    * set getCampaignUsageList.ServiceUnitCode = ''
    Given request getCampaignUsageList
    * print getCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.CampaignUsageList[0].CrmVehicleId == '#notnull'
    * match response.CampaignUsageList[0].CustomerTypeCode == 2
    * match response.Success == true


  @GetCampaignUsageList3
  Scenario: StartDate degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignUsageList'
    * def getCampaignUsageList = read('../Campaign/JsonFiles/GetCampaignUsageList.json')
    * set getCampaignUsageList.StartDate = ''
    Given request getCampaignUsageList
    * print getCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.Message == 'System.ArgumentNullException: Eksik parametre : TranIdList veya Başlangıç Bitiş Tarihi dolu olmalıdır!\r\nParameter name: request\r\n   at Rms.Campaign.Business.Core.Engine.Extensions.CampaignUsageListExtensions.GetCampaignUsages(XrmSet`1 self, GetCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetCampaignUsages(GetCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetCampaignUsageList(PromotionEngine engine, GetCampaignUsageListRequestModel request)'
    * match response.CampaignUsageList == null
    * match response.Success == false


  @GetCampaignUsageList4
  Scenario: StartDate ve EndDate degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignUsageList'
    * def getCampaignUsageList = read('../Campaign/JsonFiles/GetCampaignUsageList.json')
    * set getCampaignUsageList.StartDate = ''
    * set getCampaignUsageList.EndDate = ''
    Given request getCampaignUsageList
    * print getCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.Message == 'System.ArgumentNullException: Eksik parametre : TranIdList veya Başlangıç Bitiş Tarihi dolu olmalıdır!\r\nParameter name: request\r\n   at Rms.Campaign.Business.Core.Engine.Extensions.CampaignUsageListExtensions.GetCampaignUsages(XrmSet`1 self, GetCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetCampaignUsages(GetCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetCampaignUsageList(PromotionEngine engine, GetCampaignUsageListRequestModel request)'
    * match response.CampaignUsageList == null
    * match response.Success == false


  @GetCampaignUsageList5
  Scenario: EndDate degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignUsageList'
    * def getCampaignUsageList = read('../Campaign/JsonFiles/GetCampaignUsageList.json')
    * set getCampaignUsageList.EndDate = ''
    Given request getCampaignUsageList
    * print getCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.Message == 'System.ArgumentNullException: Eksik parametre : TranIdList veya Başlangıç Bitiş Tarihi dolu olmalıdır!\r\nParameter name: request\r\n   at Rms.Campaign.Business.Core.Engine.Extensions.CampaignUsageListExtensions.GetCampaignUsages(XrmSet`1 self, GetCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetCampaignUsages(GetCampaignUsageListRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetCampaignUsageList(PromotionEngine engine, GetCampaignUsageListRequestModel request)'
    * match response.CampaignUsageList == null
    * match response.Success == false


  @GetCampaignUsageList6
  Scenario: ServiceUnitCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignUsageList'
    * def getCampaignUsageList = read('../Campaign/JsonFiles/GetCampaignUsageList.json')
    * remove getCampaignUsageList.ServiceUnitCode
    Given request getCampaignUsageList
    * print getCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.CampaignUsageList[0].CrmVehicleId == '#notnull'
    * match response.CampaignUsageList[0].CustomerTypeCode == 2
    * match response.Success == true


  @GetCampaignUsageList7
  Scenario: CampaignCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignUsageList'
    * def getCampaignUsageList = read('../Campaign/JsonFiles/GetCampaignUsageList.json')
    * remove getCampaignUsageList.CampaignCode
    Given request getCampaignUsageList
    * print getCampaignUsageList
    When method POST
    Then status 200
    * print response
    * match response.CampaignUsageList[0].CrmVehicleId == '#notnull'
    * match response.CampaignUsageList[0].CustomerTypeCode == 2
    * match response.Success == true