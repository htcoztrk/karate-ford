Feature: Campaign-CampaignUsage

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'



  @CampaignUsage
  Scenario: Tum degerler girilerek send işlemi yapilmasi(SYS)
    Given path 'GetCampaignList'
    * def CampaignUsage_SYS = read('../Campaign/JsonFiles/CampaignUsage_GetCampaignListSYS.json')
    Given request CampaignUsage_SYS
    When method POST
    Then status 200
    * print response
    * def tranId = response.TranId
    * print tranId
    * def sleep = read('../Campaign/JsCode/sleep.js')
    * call sleep 1
    Given path 'CampaignUsage'
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * def campaignUsageSys = read('../Campaign/JsonFiles/CampaignUsage_Sys.json')
    * set campaignUsageSys.TranId = tranId
    Given request campaignUsageSys
    * print campaignUsageSys
    When method POST
    Then status 200
    * print response
    * match response.Success == true


   # * def randomOpsQuoteId = read('../CSDN/RandomValue/RandomDeger.js')
   # * set quote_create.Request.OpsQuoteId = call randomOpsQuoteId

  @CampaignUsage1
  Scenario: Tum degerler girilerek send işlemi yapilmasi(SYS)1
    Given path 'CampaignUsage'
    * def campaignUsageSys = read('../Campaign/JsonFiles/CampaignUsage_Sys.json')
    * set campaignUsageSys.TranId = "cb41135d-9815-4342-b2cd-ba731449ad98"
    Given request campaignUsageSys
    * print campaignUsageSys
    When method POST
    Then status 200
    * print response
    #* match response.Message == #notnull