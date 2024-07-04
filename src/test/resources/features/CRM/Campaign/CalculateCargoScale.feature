Feature: Campaign-CalculateCargoScale

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @Denemee
  Scenario: deneme
    Given path 'GetCampaignList'
    * def sales = read('../Campaign/JsonFiles/GetCampaignList_Sales.json')
    * request sales
    * print sales
    When method POST
    Then status 200
    * print response
    * print "\nResponse Body: \n", response
    * print "\nResponse time: " + responseTime + " ms"
    * def expectedResponseTime = 10000
    * eval karate.log('Response time: ', responseTime, ' ms')
    * if (responseTime > expectedResponseTime) karate.fail('Response time exceeded expected time')

  @CalculateCargoScale1
  Scenario: Tum degerler girilerek send islemi yapilmasi
    Given path 'CalculateCargoScale'
    * def calculateCargoScale = read('../Campaign/JsonFiles/CalculateCargoScale.json')
    Given request calculateCargoScale
    * print calculateCargoScale
    When method POST
    Then status 200
    * print response
    * match response.ScaleName == 'Sadakat %0 Skalası'
    * match response.ScaleRatio == 0.0
    * match response.Success == true


  @CalculateCargoScale2
  Scenario: Yanlis CustomerTypeCode degeri girilerek send islemi yapilmasi
    Given path 'CalculateCargoScale'
    * def calculateCargoScale = read('../Campaign/JsonFiles/CalculateCargoScale.json')
    * set calculateCargoScale.CustomerTypeCode = 1
    Given request calculateCargoScale
    * print calculateCargoScale
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Müşteri kaydı bulunamadı!'
    * match response.Success == false



  @CalculateCargoScale3
  Scenario: CrmCustomerId degeri girilmeden send islemi yapilmasi
    Given path 'CalculateCargoScale'
    * def calculateCargoScale = read('../Campaign/JsonFiles/CalculateCargoScale.json')
    * set calculateCargoScale.CrmCustomerId = ""
    Given request calculateCargoScale
    * print calculateCargoScale
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Müşteri kaydı bulunamadı!'
    * match response.Success == false


  @CalculateCargoScale4
  Scenario: CustomerTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'CalculateCargoScale'
    * def calculateCargoScale = read('../Campaign/JsonFiles/CalculateCargoScale.json')
    * remove calculateCargoScale.CustomerTypeCode
    Given request calculateCargoScale
    * print calculateCargoScale
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Specified argument was out of the range of valid values.\r\nParameter name: CustomerTypeCode değeri tanımsız :0'
    * match response.Success == false