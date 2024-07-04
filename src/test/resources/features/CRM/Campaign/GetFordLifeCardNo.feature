Feature: Campaign-GetFordLifeCardNo

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'

  @GetFordLifeCardNo1
  Scenario: Tum degerler girilerek send islemi yapilmasi (Musteri ve Arac Kart İliskisi Bulunmayan)
    Given path 'GetFordLifeCardNo'
    * def fordLifeCardNo = read('../Campaign/JsonFiles/GetFordLifeCardNo.json')
    Given request fordLifeCardNo
    * print fordLifeCardNo
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Müşteri ve Araç ile ilişkili kart bulunamadı!'
    * match response.Success == false
    * print "\nResponse Body: \n", response
    * print "\nResponse time: " + responseTime + " ms"
    * def expectedResponseTime = 10000
    * eval karate.log('Response time: ', responseTime, ' ms')
    * if (responseTime > expectedResponseTime) karate.fail('Response time exceeded expected time')


  @GetFordLifeCardNo2
  Scenario: Tanimli deger araligi disinda CustomerTypeCode degeri ile send islemi yapilmasi
    Given path 'GetFordLifeCardNo'
    * def fordLifeCardNo = read('../Campaign/JsonFiles/GetFordLifeCardNo.json')
    * set fordLifeCardNo.CustomerTypeCode = 5
    Given request fordLifeCardNo
    * print fordLifeCardNo
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Specified argument was out of the range of valid values.'
    * match response.Success == false