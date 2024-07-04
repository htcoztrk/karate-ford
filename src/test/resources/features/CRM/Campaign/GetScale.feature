Feature: Campaign-GetScale

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetScale1
  Scenario: Tum degerler girilerek indirim bilgisinin getirilmesi
    Given path 'GetScale'
    * def getScale = read('../Campaign/JsonFiles/GetScale.json')
    Given request getScale
    * print getScale
    When method POST
    Then status 200
    * print response
    * match response.DiscountTypeCode == 1
    * match response.Value == 0.0


  @GetScale2
  Scenario: ScaleTableTypeCode degeri 2 girilerek indirim oraninin getirilmesi islemi
    Given path 'GetScale'
    * def getScale = read('../Campaign/JsonFiles/GetScale.json')
    * set getScale.ScaleTableTypeCode = 2
    Given request getScale
    * print getScale
    When method POST
    Then status 200
    * print response
    * match response.DiscountTypeCode == null
    * match response.Message == "Rms.Campaign.Business.Core.ExDetails+PromotionEngineException: Birden fazla skala kaydı bulundu!\r\n   at Rms.Campaign.Business.Core.Ex.PromotionEngine(XrmExceptionDefinition ex)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetScale(GetScaleRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetScale(PromotionEngine engine, GetScaleRequestModel request)"


  @GetScale3
  Scenario: ScaleTableTypeCode degeri 5 girilerek indirim oraninin getirilmesi islemi
    Given path 'GetScale'
    * def getScale = read('../Campaign/JsonFiles/GetScale.json')
    * set getScale.ScaleTableTypeCode = 5
    Given request getScale
    * print getScale
    When method POST
    Then status 200
    * print response
    * match response.DiscountTypeCode == null
    * match response.Message == "Rms.Campaign.Business.Core.ExDetails+PromotionEngineException: Skala kaydı bulunamadı!\r\n   at Rms.Campaign.Business.Core.Ex.PromotionEngine(XrmExceptionDefinition ex)\r\n   at Rms.Campaign.Business.Core.Engine.PromotionEngine.GetScale(GetScaleRequestModel request)\r\n   at Rms.Campaign.Business.Core.WebServices.PromotionEngineApi.GetScale(PromotionEngine engine, GetScaleRequestModel request)"