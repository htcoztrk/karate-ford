Feature: CSDN-Incident

  Background:
    * header Authorization = 'Basic Y3JtYWthZGVtaUBkeW5hbWljczo3NDI5MWYwZi01ODFmLTIxNTYtNzBjMS0yNTBlMTY1YjM0MGM='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://uatcsdn-dev.azurewebsites.net'


  @Incident_Incidents
  Scenario: Incident-Incidents1
    #Tüm değerler girilir
    Given path 'incidents/childticketupdate'
    * def incident_ChildTicketUpdate = read('../CSDN/JsonFiles/Incident/Incident_ChildTicketUpdate.json')
    Given request incident_ChildTicketUpdate
    * print incident_ChildTicketUpdate
    When method POST
    Then status 200
    * print response
   # * match response.Data.Content.IsUpdated == true

  @Incident_ChildTicketUpdate1
  Scenario: Incident-ChildTicketUpdate1
    #Tüm değerler girilerek update işlemi yapılması
    Given path 'incidents/childticketupdate'
    * def incident_ChildTicketUpdate = read('../CSDN/JsonFiles/Incident/Incident_ChildTicketUpdate.json')
    Given request incident_ChildTicketUpdate
    * print incident_ChildTicketUpdate
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Incident_ChildTicketUpdate2
  Scenario: Incident-ChildTicketUpdate2
    #TicketNumber değeri girilmeden update işlemi yapılması
    Given path 'incidents/childticketupdate'
    * def incident_ChildTicketUpdate = read('../CSDN/JsonFiles/Incident/Incident_ChildTicketUpdate.json')
    Given request incident_ChildTicketUpdate
    * set incident_ChildTicketUpdate.Request.TicketNumber = ''
    * print incident_ChildTicketUpdate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'


  @Incident_ChildTicketUpdate3
  Scenario: Incident-ChildTicketUpdate3
    #SourceSystemCode değeri girilmeden update işlemi yapılması
    Given path 'incidents/childticketupdate'
    * def incident_ChildTicketUpdate = read('../CSDN/JsonFiles/Incident/Incident_ChildTicketUpdate.json')
    Given request incident_ChildTicketUpdate
    * set incident_ChildTicketUpdate.Request.SourceSystemCode = ''
    * print incident_ChildTicketUpdate
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'

  @Incident_UpdateGeoInfo1
  Scenario: Incident-UpdateGeoInfo1
    #Tüm değerler girilerek update işlemi yapılması
    Given path 'incidents/update-geo-info'
    * def incident_UpdateGeoInfo = read('../CSDN/JsonFiles/Incident/Incident_UpdateGeoInfo.json')
    Given request incident_UpdateGeoInfo
    * print incident_UpdateGeoInfo
    When method POST
    Then status 200
    * print response
    * match response.Data.Content.IsUpdated == true


  @Incident_UpdateGeoInfo2
  Scenario: Incident-UpdateGeoInfo2
    #Id değeri girilmeden update işlemi yapılması
    Given path 'incidents/update-geo-info'
    * def incident_UpdateGeoInfo = read('../CSDN/JsonFiles/Incident/Incident_UpdateGeoInfo.json')
    * set incident_UpdateGeoInfo.Request.Id = ''
    Given request incident_UpdateGeoInfo
    * print incident_UpdateGeoInfo
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre zorunludur ve boş değer (00000000-0000-0000-0000-000000000000) olamaz.'


  @Incident_UpdateGeoInfo3
  Scenario: Incident-UpdateGeoInfo3
    #Latitude değeri girilmeden update işlemi yapılması
    Given path 'incidents/update-geo-info'
    * def incident_UpdateGeoInfo = read('../CSDN/JsonFiles/Incident/Incident_UpdateGeoInfo.json')
    * set incident_UpdateGeoInfo.Request.Latitude = ''
    Given request incident_UpdateGeoInfo
    * print incident_UpdateGeoInfo
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Incident_UpdateGeoInfo4
  Scenario: Incident-UpdateGeoInfo4
    #Longitude değeri girilmeden update işlemi yapılması
    Given path 'incidents/update-geo-info'
    * def incident_UpdateGeoInfo = read('../CSDN/JsonFiles/Incident/Incident_UpdateGeoInfo.json')
    * set incident_UpdateGeoInfo.Request.Longitude = ''
    Given request incident_UpdateGeoInfo
    * print incident_UpdateGeoInfo
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'


  @Incident_UpdateGeoInfo5
  Scenario: Incident-UpdateGeoInfo5
    #Address değeri girilmeden update işlemi yapılması
    Given path 'incidents/update-geo-info'
    * def incident_UpdateGeoInfo = read('../CSDN/JsonFiles/Incident/Incident_UpdateGeoInfo.json')
    * set incident_UpdateGeoInfo.Request.Address = ''
    Given request incident_UpdateGeoInfo
    * print incident_UpdateGeoInfo
    When method POST
    Then status 200
    * print response
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'
