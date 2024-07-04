Feature: Deneme

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'

  @Deneme1
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

    #* match response.CampaignList[0].CampaignId == '#notnull'
    #* match response.Success == true

  @Deneme2
Scenario: test
    * print '****************'
    * print 'AAAAAAAAA'