***Settings***
Library  SeleniumLibrary

****Keywords***
User launches browser
    Open Browser  about:blank  gc
    Maximize Browser Window

User terminates browser
    Close Browser

As a customer I login to bookswagon website
    [Arguments]  ${siteurl}
    Go To  ${siteurl}
    Input Text  ${elem_username}  ${userName}
    Input Text  ${elem_password}  ${passWord}
    Wait for element and Click  ${elem_login}

verify user successfully landed on the home page
    Wait for text to be visible in screen  ${dashboard}

I navigate to Book > Technology & Engineering category
    Wait for element and Click  ${elem_bookList}
    Search for Technology and Engineering section  ${category_name}


Search for Technology and Engineering section
    [Arguments]  ${required_category}
    ${category_len} =  Get Element Count  xpath=//div[@class='desktopmenupopup']/ul/li
    Log to Console  ${category_len}
    FOR  ${i}  IN RANGE  1  ${category_len}
        ${expected_categ} =  Get Text  xpath=//div[@class='desktopmenupopup']/ul/li[${i}]/a
        Exit For Loop If  "${expected_categ}" == "${required_category}"
    END
    Set Test Variable  ${static_categ}  xpath=//div[@class='desktopmenupopup']/ul/li[${i}]/a
    Log to Console  ${required_category}
    Click Element   ${static_categ}

Scroll and search for the book named
    [Arguments]  ${bookName}
    ${book_len} =  Get Element Count  xpath=//div[@id='listSearchResult']/div
    Log to Console  ${book_len}
    FOR  ${j}  IN RANGE  1  ${book_len}
        ${dyn_books} =  Get Text  xpath=//div[@id='listSearchResult']/div[${j}]/div[3]/div[1]/a
        Log to Console  ${dyn_books}
        Exit For Loop If  "${dyn_books}" == "${bookName}"
        Scroll Element Into View  xpath=//div[@id='listSearchResult']/div[${j}]/div[3]/div[1]/a
    END
    Set Test Variable  ${static_book_elem}  xpath=//div[@id='listSearchResult']/div[${j}]/div[3]/div[1]/a
    Click Element  ${static_book_elem}

Verify the author name of the book as
    [Arguments]  ${expectd_name}
    ${authr_name} =  Get Text  ${elem_authr}
    #Should Be True  "${authr_name}" == "${name}"
    Should Contain  ${authr_name}  ${expectd_name}

Wait for element and Click
    [Arguments]  ${click_element}
    Wait Until Element Is Visible  ${click_element}  timeout=20s
    Click Element  ${click_element}


Wait for text to be visible in screen
    [Arguments]  ${text}
    Wait Until Page Contains  ${text}  timeout=20s