*** Settings ***
Library  AppiumLibrary
Resource    ../Resources/password.robot
Resource    ../Resources/android-resource.robot

# surplus.surplus_apps_customer
# surplus.surplus_apps_customer.MainActivity
*** Test Cases ***
Open_Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=surplus.surplus_apps_customer   appActivity=surplus.surplus_apps_customer.MainActivity    automationName=Uiautomator2
    Wait Until Page Contains Element   ${LOCATION}
    Click Element                       ${LOCATION}
    Wait Until Page Contains Element   ${NOTIF}
    Click Element                       ${NOTIF}
    Wait Until Page Contains Element   ${MASUK}
    Click Element                       ${MASUK}
    Wait Until Page Contains Element   ${LOGIN-INPUT}
    Input Text                         ${LOGIN-INPUT}    ${USER}[username]
    Input Text                         ${PASSWORD-INPUT}    ${USER}[password]
    Sleep    5s
    Click Element   ${LOGIN-MASUK}

    