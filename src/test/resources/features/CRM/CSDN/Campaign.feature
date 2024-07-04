Feature: CSDN-Campaign

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Campaign_RemoveVehicle1
  Scenario: Campaign-RemoveVehicle1
    #Tüm değerler girilerek remove işlemi yapılması
    Given path 'campaign/removevehicle'
    * def campaign_removevehicle = read('../CSDN/JsonFiles/Campaign/CampaignRemoveVehicle.json')
    Given request campaign_removevehicle
    * print campaign_removevehicle
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsSuccess == true


  @Campaign_RemoveVehicle2
  Scenario: Campaign-RemoveVehicle2
    #VIN değeri girilmeden remove işlemi yapılması
    Given path 'campaign/removevehicle'
    * def campaign_removevehicle = read('../CSDN/JsonFiles/Campaign/CampaignRemoveVehicle.json')
    * set campaign_removevehicle.Request.VIN = ''
    Given request campaign_removevehicle
    * print campaign_removevehicle
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Campaign_RemoveVehicle3
  Scenario: Campaign-RemoveVehicle3
    #CancelDate değeri girilmeden remove işlemi yapılması
    Given path 'campaign/removevehicle'
    * def campaign_removevehicle = read('../CSDN/JsonFiles/Campaign/CampaignRemoveVehicle.json')
    * set campaign_removevehicle.Request.CancelDate = ''
    Given request campaign_removevehicle
    * print campaign_removevehicle
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Hatalı veri formatı.'