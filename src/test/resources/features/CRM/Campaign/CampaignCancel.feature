Feature: Campaign-CampaignCancel

  Background:
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * header Content-Type = 'application/json'
    * url 'https://idluatcrmapp02-test.azurewebsites.net/Campaign'



  @CampaignCancel1
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
    Given path 'CampaignCancel'
    * header Authorization = 'Basic Y3JtOnBhc3M='
    * configure ssl = true
    * def campaignCancel = read('../Campaign/JsonFiles/CampaignCancel.json')
    * set campaignCancel.TranId = tranId
    Given request campaignCancel
    * print campaignCancel
    When method POST
    Then status 200


  @CampaignCancel2
  Scenario: Daha once kullanilmis TranId degeri ile cancel islemi yapma
    Given path 'CampaignCancel'
    * def campaignCancel = read('../Campaign/JsonFiles/CampaignCancel.json')
    Given request campaignCancel
    * print campaignCancel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek geçerlilik doğrulama işlemi çalışırken hata meydana geldi : Daha önce kullanım iptali kaydı oluşturulmuş! '
    * match response.Success == false


  @CampaignCancel3
  Scenario: InvoceDate degerini girilmeden cancel işlemi yapilmasi
    Given path 'CampaignCancel'
    * def campaignCancel = read('../Campaign/JsonFiles/CampaignCancel.json')
    * set campaignCancel.InvoiceDate = ''
    Given request campaignCancel
    * print campaignCancel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek geçerlilik doğrulama işlemi çalışırken hata meydana geldi : Kullanım iptali için gerekli alanları doldurunuz! '
    * match response.Success == false


  @CampaignCancel4
  Scenario: InvoiceNo degerini girilmeden cancel işlemi yapilmasi
    Given path 'CampaignCancel'
    * def campaignCancel = read('../Campaign/JsonFiles/CampaignCancel.json')
    * set campaignCancel.InvoiceNo = ''
    Given request campaignCancel
    * print campaignCancel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek geçerlilik doğrulama işlemi çalışırken hata meydana geldi : Kullanım iptali için gerekli alanları doldurunuz! '
    * match response.Success == false


  @CampaignCancel5
  Scenario: UserName degerini girilmeden cancel işlemi yapilmasi
    Given path 'CampaignCancel'
    * def campaignCancel = read('../Campaign/JsonFiles/CampaignCancel.json')
    * set campaignCancel.UserName = ''
    Given request campaignCancel
    * print campaignCancel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek geçerlilik doğrulama işlemi çalışırken hata meydana geldi : Kullanım iptali için gerekli alanları doldurunuz! '
    * match response.Success == false


  @CampaignCancel6
  Scenario: Aktif kampanya bulunmayan TranId ile cancel islemi yapma
    Given path 'CampaignCancel'
    * def campaignCancel = read('../Campaign/JsonFiles/CampaignCancel.json')
    * set campaignCancel.TranId = 'b6ff35ef-8fad-4985-a9e4-4b5db5b9623d'
    Given request campaignCancel
    * print campaignCancel
    When method POST
    Then status 200
    * print response
    * match response.Message == 'İstek geçerlilik doğrulama işlemi çalışırken hata meydana geldi : İptal edilecek aktif kullanım bulunamadı! '
    * match response.Success == false