*** Settings ***
Library    SeleniumLibrary    
Test Setup    Open Browser And Maximize
Test Teardown    Close Browser And Capture Screen Of Last Page 
Library           Collections   
*** Test Cases ***
test Sorting comper price of items
      Select From List By Value    id=selectProductSort    price:desc
      sleep     2s

       ${webElements1}    Get Webelements   ${Xcesta}
       ${count}=    Get Element Count    ${Xcesta}
       :FOR    ${i}    IN RANGE    0    ${count} + 1
       \    ${name}=    Get Text   ( ${Xcesta})[${i}]
       \    Append To List   ${name}
#porovnani ceny  1 a ceny 2, cena 2 musi byt rovna nebo vetsi nez cena jedna
    
    
*** Keywords ***    
Open Browser And Maximize
    Open Browser    http://automationpractice.com/index.php?id_category=3&controller=category    chrome
    Maximize Browser Window  
Close Browser And Capture Screen Of Last Page    
    Capture Page Screenshot    
    Close Browser
*** Variables ***
${Xcesta}=    xpath=//div[@class="left-block"]//span[@class="price product-price"]   