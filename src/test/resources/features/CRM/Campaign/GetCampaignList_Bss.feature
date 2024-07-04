Feature: Campaign-GetCampaignList_BSS

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'


  @GetCampaignList_BSS1
  Scenario: Tum degerler girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.ProductList[0].PromotionList[0].TypeName == '#notnull'
    * match response.Success == true


  @GetCampaignList_BSS2
  Scenario: UnitCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.UnitCode
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS3
  Scenario: Tanimli olmayan aralikta CustomerTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.CustomerTypeCode = '3'
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : Specified argument was out of the range of valid values. '
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS4
  Scenario: Yanlis CustomerTypeCode degeri girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.CustomerTypeCode = 1
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek Geçerlilik Kontrol İşlemi çalışırken hata meydana geldi : CrmCustomerId alanı 68c98432-a788-eb11-a812-000d3ab4aa1e değeri ile CRM de bulunamadı! | Varlık: Müşteri '
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS5
  Scenario: CrmCustomerId degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.CrmCustomerId = ""
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.ProductList[0].PromotionList[0].TypeName == '#notnull'
    * match response.Success == true


  @GetCampaignList_BSS6
  Scenario: CrmOpportunityId degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.CrmOpportunityId = ""
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.ProductList[0].PromotionList[0].TypeName == '#notnull'
    * match response.Success == true


  @GetCampaignList_BSS7
  Scenario: ClientTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.ClientTypeCode
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSS8
  Scenario: SalesTypeCode alanina yanlis veri tipinde deger girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.SalesTypeCode = 'test'
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Geçerli Kampanyaları Yükleme ve Önfiltreleme İşlemleri çalışırken hata meydana geldi : Passed value should be a valid option value '
    * match response.Success == false


  @GetCampaignList_BSS9
  Scenario: SalesTypeCode parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.SalesTypeCode
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSS10
  Scenario: ProductList[0].RowNumber parametresine yanlis veri tipinde deger girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.ProductList[0].RowNumber = 'test'
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS11
  Scenario: ProductList[0].Id degeri bos gonderilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.ProductList[0].Id = ''
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS12
  Scenario: ProductList[0].Name parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.ProductList[0].Name
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSS13
  Scenario: ProductList[0].ModelId degeri girilmeden send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.ProductList[0].ModelId
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS14
  Scenario: ProductList[0].ModelId parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.ProductList[0].ModelId
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSS15
  Scenario: Yanlis veri tipinde ProductList[0].ModelYear degeri gönderilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.ProductList[0].ModelYear = 'test'
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    #* match response.TranId == '00000000-0000-0000-0000-000000000000'
    #* match response.Success == false


  @GetCampaignList_BSS16
  Scenario: ProductList[0].Quantity degeri bos gonderilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.ProductList[0].Quantity = ''
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS17
  Scenario: ProductList[0].Quantity parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.ProductList[0].Quantity
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSS18
  Scenario: ProductList[0].UnitAmount degeri bos gonderilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.ProductList[0].UnitAmount = ''
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS19
  Scenario: ProductList[0].UnitAmount parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.ProductList[0].UnitAmount
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false


  @GetCampaignList_BSS20
  Scenario: ProductList[0].BaseUnitAmount degeri bos gonderilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.ProductList[0].BaseUnitAmount = ''
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS21
  Scenario: ProductList[0].BaseUnitAmount parametresi silinerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * remove bss.Request.ProductList[0].BaseUnitAmount
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Api tanımı bulunamadı!'
    * match response.Success == false

  @GetCampaignList_BSS22
  Scenario: SourceTypeCode alanina string deger girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.SourceTypeCode = 'test'
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Geçerli Kampanyaları Yükleme ve Önfiltreleme İşlemleri çalışırken hata meydana geldi : Passed value should be a valid option value '
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false


  @GetCampaignList_BSS23
  Scenario: KocFamilyMemberTypeCode alanina string deger girilerek send islemi yapilmasi
    Given path 'GetCampaignList'
    * def bss = read('../Campaign/JsonFiles/GetCampaignList_Bss.json')
    * set bss.Request.KocFamilyMemberTypeCode = 'test'
    Given request bss
    * print bss
    When method POST
    Then status 200
    * print response
    * match response.Message == 'Geçerli Kampanyaları Yükleme ve Önfiltreleme İşlemleri çalışırken hata meydana geldi : Passed value should be a valid option value '
    * match response.TranId == '00000000-0000-0000-0000-000000000000'
    * match response.Success == false