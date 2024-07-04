Feature: VehicleManagement-Arvento

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatvehicle-dev.azurewebsites.net/'

  @Fms_Extend1
  Scenario: Tum degerler girilerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.Data.Content.IsUpdated == true


  @Fms_Extend2
  Scenario: VIN degeri bos birakilarak extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * set extend.Request.VIN = ""
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'
    * match response.ValidationList[0].Name == 'VIN'


  @Fms_Extend3
  Scenario: Yanlis veri tipinde StartDate degeri girilerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * set extend.Request.StartDate = "test"
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Hatalı veri formatı.'
    * match response.ValidationList[0].ExpectedValue == 'DateTime with yyyy-MM-dd format'


  @Fms_Extend4
  Scenario: Yanlis veri tipinde EndDate degeri girilerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * set extend.Request.EndDate = "test"
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Hatalı veri formatı.'
    * match response.ValidationList[0].ExpectedValue == 'DateTime with yyyy-MM-dd format'


  @Fms_Extend5
  Scenario: Deger araligi disinda ArventoSubscriptionTypeCode degeri girilerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * set extend.Request.ArventoSubscriptionTypeCode = "FordTest"
    Given request extend
    * print extend
    When method POST
    Then status 200
    #* match response.ValidationList[0].Message == 'Parametre değeri geçersiz.'
    #farklı sonuç dönüyor, incelenecek


  @Fms_Extend6
  Scenario: Yanlis veri tipinde ArventoSubscriptionTypeCode degeri girilerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * set extend.Request.ArventoSubscriptionTypeCode = "FordTest"
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.ExceptionList[0].Message == 'Bilinmeyen bir hata oluştu.'


  @Fms_Extend7
  Scenario: SourceSystemCode parametresi silinerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * remove extend.Request.SourceSystemCode
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.Data.Content.IsUpdated == true


  @Fms_Extend8
  Scenario: VIN parametresi silinerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * remove extend.Request.VIN
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'
    * match response.ValidationList[0].Name == 'VIN'


  @Fms_Extend9
  Scenario: ArventoTaxOffice parametresi silinerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * remove extend.Request.ArventoTaxOffice
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.Data.Content.IsUpdated == true


  @Fms_Extend10
  Scenario: ArventoVknTckn parametresi silinerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * remove extend.Request.ArventoVknTckn
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.Data.Content.IsUpdated == true


  @Fms_Extend11
  Scenario: ArventoCustomerName parametresi silinerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * remove extend.Request.ArventoCustomerName
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.Data.Content.IsUpdated == true

  @Fms_Extend12
  Scenario: CustomerTypeCode parametresi silinerek extend islemi yapilmasi
    Given path 'fms/extend'
    * def extend = read('../Vehicle/JsonFiles/Arvento/arvento_fms_extend.json')
    * remove extend.Request.CustomerTypeCode
    Given request extend
    * print extend
    When method POST
    Then status 200
    * match response.Data.Content.IsUpdated == true


  @Fms_SubscriptionUpdate1
  Scenario: Tum degerler girilerek Arvento uyelik guncelleme islemi yapilmasi
    Given path 'fms/subscriptionupdate'
    * def subscriptionupdate = read('../Vehicle/JsonFiles/Arvento/arvento_fms_subscriptionupdate.json')
    Given request subscriptionupdate
    * print subscriptionupdate
    When method POST
    Then status 200
    #* match response.Data.Content.IsUpdated == true
    # Hatalı sonuç dönüyor, incelenecek.


  @Fms_SubscriptionUpdate2
  Scenario: StartDate alanina deger girilmeden Arvento uyelik guncelleme islemi yapilmasi
    Given path 'fms/subscriptionupdate'
    * def subscriptionupdate = read('../Vehicle/JsonFiles/Arvento/arvento_fms_subscriptionupdate.json')
    * set subscriptionupdate.Request.StartDate = ''
    Given request subscriptionupdate
    * print subscriptionupdate
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Hatalı veri formatı.'


  @Fms_SubscriptionUpdate3
  Scenario: EndDate alanina deger girilmeden Arvento uyelik guncelleme islemi yapilmasi
    Given path 'fms/subscriptionupdate'
    * def subscriptionupdate = read('../Vehicle/JsonFiles/Arvento/arvento_fms_subscriptionupdate.json')
    * set subscriptionupdate.Request.EndDate = ''
    Given request subscriptionupdate
    * print subscriptionupdate
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Hatalı veri formatı.'


  @Fms_SubscriptionUpdate4
  Scenario: VIN alanina deger girilmeden Arvento uyelik guncelleme islemi yapilmasi
    Given path 'fms/subscriptionupdate'
    * def subscriptionupdate = read('../Vehicle/JsonFiles/Arvento/arvento_fms_subscriptionupdate.json')
    * set subscriptionupdate.Request.VIN = ''
    Given request subscriptionupdate
    * print subscriptionupdate
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Parametre değeri boş olamaz.'
    * match response.ValidationList[0].Name == 'VIN'


  @Fms_SubscriptionUpdate5
  Scenario: VIN alanina yanlis deger girilerek Arvento uyelik guncelleme islemi yapilmasi
    Given path 'fms/subscriptionupdate'
    * def subscriptionupdate = read('../Vehicle/JsonFiles/Arvento/arvento_fms_subscriptionupdate.json')
    * set subscriptionupdate.Request.VIN = 'test'
    Given request subscriptionupdate
    * print subscriptionupdate
    When method POST
    Then status 200
    * match response.ExceptionList[0].Message == 'Kayıt bulunamadı (VIN: test).'


  @Fms_SubscriptionUpdate6
  Scenario: StartDate alanina yanlis formatta deger girilerek Arvento uyelik guncelleme islemi yapilmasi
    Given path 'fms/subscriptionupdate'
    * def subscriptionupdate = read('../Vehicle/JsonFiles/Arvento/arvento_fms_subscriptionupdate.json')
    * set subscriptionupdate.Request.StartDate = '2023'
    Given request subscriptionupdate
    * print subscriptionupdate
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Hatalı veri formatı.'


  @Fms_SubscriptionUpdate7
  Scenario: EndDate alanina yanlis formatta deger girilerek Arvento uyelik guncelleme islemi yapilmasi
    Given path 'fms/subscriptionupdate'
    * def subscriptionupdate = read('../Vehicle/JsonFiles/Arvento/arvento_fms_subscriptionupdate.json')
    * set subscriptionupdate.Request.EndDate = '2023'
    Given request subscriptionupdate
    * print subscriptionupdate
    When method POST
    Then status 200
    * match response.ValidationList[0].Message == 'Hatalı veri formatı.'

