*** Settings ***
Library             AppiumLibrary
Resource            password.robot

*** Variables ***


&{USER}    username=prod@robot-mail.com     password=Asmpsh123

#*** Test Variables ***
&{USER-DETAILS}                 email=berashitam@outlook.com     password=${USERPASSWORD}
&{USER-DETAILS1}                passwords=${KATASANDI}
&{event-title}                  event=HAHAHIHI
${INV-USER}                     Demo Prospaces
${EVENT-NAME}                   HAHAHIHI
${timeout}                      timeout=30
${sec}                          30
${wait15}                       15
${DESKHOUR-STARTTIME-INPUT}     09
${DESKMINUTE-STARTTIME-INPUT}   30
${DESKHOUR-ENDTIME-INPUT}       12
${MINUTEHOUR-ENDTIME-INPUT}     00
${coordinate_x}                 615
${coordinate_y}                 1098

#*** Application Variable ***
${PROSPACE-APPLICATION-ID}          io.prospace.conferencingbooking.dev
${PROSPACE-APPLICATION-ACTIVITY}    io.prospace.conferencingbooking.ui.views.splash.SplashActivity

# ***Akses location Page***
${LOCATION}                     id=com.android.permissioncontroller:id/permission_allow_foreground_only_button

# ***Notif Allow Page***
${NOTIF}                       id=com.android.permissioncontroller:id/permission_allow_button


#*** Selamat Datang Page ***
${MASUK}                        //android.widget.TextView[@text="Sudah punya akun? Masuk"]
${SIGNIN-COPYRIGHT}             //android.widget.TextView[@text="Welcome to ProSpace"]

#*** Log in - PAGE ***
${LOGIN-INPUT}                  //android.widget.EditText[@text="Alamat email kamu"]
${PASSWORD-INPUT}               //android.widget.EditText[@text="Masukkan kata sandi"]
${LOGIN-MASUK}                 //android.widget.TextView[@text="Masuk"]
${LOGIN-FB}                 //android.widget.TextView[@text="Facebook"]
${FORGOT-PASSWORD}              //android.widget.TextView[contains(@text,"Forgot Password")]
${LOGIN-SIGNIN2-ME}             id=chat21.android.demo:id/login
${LOGIN-WARNING}                //android.widget.TextView[contains(@text,"Please make sure you insert the correct email and password.")]

#*** Forgot Password ***
${BOX-EMAIL}                    id=io.prospace.conferencingbooking.dev:id/inputEmail
${SEND-LINK}                    id=io.prospace.conferencingbooking.dev:id/btnLogin
${EMAIL-SENDED}                 //android.widget.TextView[@text="Email Sent"]
${BACK-LOGIN}                   id=io.prospace.conferencingbooking.dev:id/btnRight

#*** HOME PAGE ***



*** Keywords ***
Open Prospace Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=192.168.1.6:5555    appPackage=${PROSPACE-APPLICATION-ID}   appActivity=${PROSPACE-APPLICATION-ACTIVITY}    automationName=Uiautomator2
Log My User
    Log    ${USER}[username]
Log My Password
    Log    ${USER}[password]    
Signin with user
    [Arguments]     ${EMAIL}            ${USERPASSWORD}
    Signin option
#    Lupa Password
#    Forget Password Page
    Input User Email                    ${EMAIL}
    Input user Password                 ${USER-DETAILS1}[passwords]
    Remember me
    Submit login
    Login Wrong Password
    Re-input User Password              ${USERPASSWORD}
    Submit login
    Verify login is successful

#Lupa Password
#    WAIT UNTIL ELEMENT IS VISIBLE       ${FORGOT-PASSWORD}
#    click element                       ${FORGOT-PASSWORD}

#Forget Password Page
#    [Arguments]    ${EMAIL}
#    Wait Until Page Contains Element    ${LOGIN-EMAIL-FIELD}
#    INPUT TEXT                          ${LOGIN-EMAIL-FIELD}        ${USER-DETAILS}[email]
#    click element                       ${SEND-LINK}
#    WAIT UNTIL ELEMENT IS VISIBLE       ${EMAIL-SENDED}
#    click element                       ${BACK-LOGIN}

Signin option
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${SIGNIN-SUBMIT-BUTTON}
    Click element                       ${SIGNIN-SUBMIT-BUTTON}

Input User Email
    [Arguments]    ${EMAIL}
    Wait Until Page Contains Element    ${LOGIN-EMAIL-FIELD}
    INPUT TEXT                          ${LOGIN-EMAIL-FIELD}        ${EMAIL}

Remember me
    click element                       ${LOGIN-REMEMBERME-FIELD}

Input User Password
    [Arguments]    ${KATASANDI}
    INPUT TEXT                          ${LOGIN-PASSWORD-FIELD}     ${KATASANDI}

Re-input User Password
    [Arguments]    ${USERPASSWORD}
    clear text                          ${LOGIN-PASSWORD-FIELD}
    INPUT TEXT                          ${LOGIN-PASSWORD-FIELD}     ${USERPASSWORD}

Login Wrong Password
    wait until element is visible       ${LOGIN-WARNING}

Submit login
    Click Element                       ${LOGIN-SIGNIN2-ME}

Verify login is successful
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${MAIN-HOME-TAB}    ${sec}

Logout with user
    Click the logout button
    Verify logout is successful

Building Change setting page A
    Go to setting page
    Building Change A

Building Change setting page B
    Go to setting page
    Building Change B

Building Change A
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${PREFERRED-LOCATION-BUTTON}
    click element                       ${PREFERRED-LOCATION-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${SMARTOFFICE-LOCATION-BUTTON}
    click element                       ${SMARTOFFICE-LOCATION-BUTTON}
    click element                       ${NEXT-LOCATION-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${FLOOR-LOCATION-BUTTON}
    click element                       ${FLOOR-LOCATION-BUTTON}
    click element                       ${NEXT-LOCATION-BUTTON1}
    Wait Until Page Contains Element    ${BACK-LOCATION-BUTTON}
    Click Element                       ${BACK-LOCATION-BUTTON}
    wait until element is visible       ${BACK-SETTING-BUTTON}
    click element                       ${BACK-SETTING-BUTTON}

Building Change B
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${PREFERRED-LOCATION-BUTTON}
    click element                       ${PREFERRED-LOCATION-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${THESHARDLONDON-LOCATION-BUTTON}
    click element                       ${THESHARDLONDON-LOCATION-BUTTON}
    click element                       ${NEXT-LOCATION-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${FLOOR-LOCATION-BUTTON}
    click element                       ${FLOOR-LOCATION-BUTTON}
    click element                       ${NEXT-LOCATION-BUTTON1}
    Wait Until Page Contains Element    ${BACK-LOCATION-BUTTON}
    Click Element                       ${BACK-LOCATION-BUTTON}

Go to setting page
    Wait Until Page Contains Element    ${SETTING-HOME-BUTTON}
    Click Element                       ${SETTING-HOME-BUTTON}

Click the logout button
    Wait Until Page Contains Element    ${SIGNOUT-LOCATION-BUTTON}
    Click Element                       ${SIGNOUT-LOCATION-BUTTON}
    Wait Until Page Contains Element    ${SIGNOUTYES-LOCATION-BUTTON}
    Click Element                       ${SIGNOUTYES-LOCATION-BUTTON}

Verify logout is successful
    Wait until Page Contains Element    ${SIGNIN-COPYRIGHT}

Reservation Desk On Home Page
    [Arguments]    ${DESKHOUR-STARTTIME-INPUT}      ${DESKMINUTE-STARTTIME-INPUT}      ${DESKHOUR-ENDTIME-INPUT}    ${MINUTEHOUR-ENDTIME-INPUT}
    Go to Desk Page
    Make DR Reservation In Home Page     ${DESKHOUR-STARTTIME-INPUT}      ${DESKMINUTE-STARTTIME-INPUT}      ${DESKHOUR-ENDTIME-INPUT}    ${MINUTEHOUR-ENDTIME-INPUT}


Go to Desk Page
    Click Element                       ${FLOAT-HOME-BUTTON}
    Click Element                       ${DESK-HOME-BUTTON}
    wait until page contains element    ${DESK-PAGE}

Make DR Reservation In Home Page
    [Arguments]    ${DESKHOUR-STARTTIME-INPUT}      ${DESKMINUTE-STARTTIME-INPUT}    ${DESKHOUR-ENDTIME-INPUT}    ${MINUTEHOUR-ENDTIME-INPUT}
    Wait Until Page Contains Element    ${DATE-DESK-BUTTON}
    Click Element                       ${DATE-DESK-BUTTON}
    Wait Until Page Contains Element    ${DESK-RESERVATION1}
    Click Element                       ${DESK-RESERVATION1}
    Click Element                       ${DESK-FD}
#    Click Element                       ${STARTTIME-DESK-BUTTON}
#    Wait Until Page Contains Element    ${TIMETOGGLE-DESK-BUTTON}
#    Click Element                       ${TIMETOGGLE-DESK-BUTTON}
#    Wait Until Page Contains Element    ${HOUR-DESK-BUTTON}
#    Input Text                          ${HOUR-DESK-BUTTON}         ${DESKHOUR-STARTTIME-INPUT}
#    Input Text                          ${MINUTE-DESK-BUTTON}       ${DESKMINUTE-STARTTIME-INPUT}
#    Click Element                       ${OK-BUTTON}
#    Click Element                       ${ENDTIME-DESK-BUTTON}
#    wait until page contains element    ${TIMETOGGLE-DESK-BUTTON}
#    Click Element                       ${TIMETOGGLE-DESK-BUTTON}
#    Input Text                          ${HOUR-DESK-BUTTON}         ${DESKHOUR-ENDTIME-INPUT}
#    Input Text                          ${MINUTE-DESK-BUTTON}       ${MINUTEHOUR-ENDTIME-INPUT}
#    Click Element                       ${OK-BUTTON}
    Click Element                       ${FIND-DESK-BUTTON}
    Wait Until Page Contains Element    ${ROOMNAME-DESK-BUTTON}
    Click Element                       ${ROOMNAME-DESK-BUTTON}
    Wait until page contains element    ${NEXTSTEP-DESK-BUTTON}
    Click Element                       ${NEXTSTEP-DESK-BUTTON}
    Wait Until Page Contains Element    ${FLOORPLANVIEW-DESK-BUTTON}
    Click Element                       ${LISTVIEW-DESK-BUTTON}
    Click Element                       ${AVAILABLE-DESK-BUTTON}
    Click Element                       ${BOOK-DESK-BUTTON}
    Wait Until Page Contains Element    ${DONE-DESK-BUTTON}
    Click Element                       ${DONE-DESK-BUTTON}

Cancel DR Reservation
    Wait Until Page Contains Element    ${CANCEL-DESK-HOME-BUTTON}
    Click Element                       ${CANCEL-DESK-HOME-BUTTON}
    Wait Until Page Contains Element    ${YES-CANCEL-DESK-BUTTON}
    Click Element                       ${YES-CANCEL-DESK-BUTTON}
    Wait Until Page Contains Element    ${DONE-DESK-CANCEL-BUTTON}
    Click Element                       ${DONE-DESK-CANCEL-BUTTON}

Reservation Room On Home Page
    Go to Room Page
    Make Room Reservation

Go to Room Page
    Wait Until Page Contains Element    ${FLOAT-HOME-BUTTON}
    Click Element                       ${FLOAT-HOME-BUTTON}
    Click Element                       ${ROOM-HOME-BUTTON}
    Click Element                       ${TIME(30)-HOME-BUTTON}
    Wait Until Page Contains Element    ${BOOK-SPACE-PAGE}

Make Room Reservation
    Click Element                       ${FILTER-BOOK-BUTTON}
    Wait Until Page Contains Element    ${FLOOR-MENU-BUTTON}
    Click Element                       ${FLOOR-MENU-BUTTON}
    Wait Until Page Contains Element    ${EXPAND-FLOOR-BUTTON}
    Click Element                       ${FLOOR-BOOK-BUTTON}
    Wait Until Page Contains Element    ${TIME-BOOK-BUTTON}
    Click Element                       ${TIME-BOOK-BUTTON}
    Wait Until Page Contains Element    ${SUGGESTEDTIME-BOOK-BUTTON}
    Click Element                       ${SUGGESTEDTIME-BOOK-BUTTON}
    Wait Until Page Contains Element    ${SPACENAME-BOOK-BUTTON}        ${sec}
    Click Element                       ${SPACENAME-BOOK-BUTTON}
    wait until page contains element    ${BOOKNOW-BUTTON}
    Click Element                       ${BOOKNOW-BUTTON}
    Wait Until Page Contains Element    ${BACK-BUTTON}
    Click Element                       ${BACK-BUTTON}



Edit a room event
    Edit room event
    Cancel room reservation

Edit room event
    WAIT UNTIL ELEMENT IS VISIBLE       ${VIEW-EVENT}
    click element                       ${VIEW-EVENT}
    WAIT UNTIL ELEMENT IS VISIBLE       ${Edit-Event}
    click element                       ${Edit-Event}
    WAIT UNTIL ELEMENT IS VISIBLE       ${Text-Edit-page}
    INPUT TEXT                          ${INVITEUSER-EVENT-BUTTON}      ${INV-USER}
    Click element                       ${USER-INVITED}
    click element                       ${TITLE-EVENT-BUTTON}
    INPUT TEXT                          ${TITLE-EVENT-BUTTON}           ${USER-DETAILS1}[passwords]
    Click Element At Coordinates        ${coordinate_x}     ${coordinate_y}
    Click Element                       ${SAVE-EVENT-BUTTON}
    Wait Until Page Contains Element    ${BACK-EDIT}
    click element                       ${BACK-EDIT}

Cancel room reservation
    WAIT UNTIL ELEMENT IS VISIBLE       ${CANCEL-ROOM-BUTTON}
    click element                       ${CANCEL-ROOM-BUTTON}
    WAIT UNTIL ELEMENT IS VISIBLE       ${YES-CANCEL-ROOM-BUTTON}
    click element                       ${YES-CANCEL-ROOM-BUTTON}
    WAIT UNTIL ELEMENT IS VISIBLE       ${Message-cancel-room}
    click element                       ${YES-CANCEL-ROOM-BUTTON}

Calendar Room Reservation
    Go to Calendar Page
    Make Room Reservation in Calendar

Go to Calendar Page
    Wait Until Page Contains Element    ${CALENDAR-HOME-PAGE}
    Click Element                       ${CALENDAR-HOME-PAGE}
    Wait Until Page Contains Element    ${CALENDER-TITLE}

Make Room Reservation in Calendar
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${NEXT-MONTH}
    click element                       ${NEXT-MONTH}
    Click Element                       ${MONTH-EVENT-BUTTON}
    Wait Until Page Contains Element    ${PICKDATE-EVENT-BUTTON}
    Click Element                       ${PICKDATE-EVENT-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${MONTH-EVENT-BUTTON}
    Click Element                       ${MONTH-EVENT-BUTTON}
    Click Element At Coordinates        ${coordinate_x}     ${coordinate_y}
    Click Element                       ${CREATEEVENT-CALENDER-BUTTON}
    Wait Until Page Contains Element    ${BUILDING-CALENDAR-PAGE}
    Click Element                       ${BUILDING-CALENDAR-PAGE}
    Wait Until Page Contains Element    ${SMARTOFFICE-LOCATION-BUTTON}
    Click Element                       ${SMARTOFFICE-LOCATION-BUTTON}
    Wait Until Page Contains Element    ${FLOOR-CALENDAR-BUTTON}
    Click Element                       ${FLOOR-CALENDAR-BUTTON}
    Click Element                       ${SPACE-CALENDAR-BUTTON}
    Wait Until Page Contains Element    ${SPACENAME-CALENDAR-BUTTON}
    Click Element                       ${SPACENAME-CALENDAR-BUTTON}
    INPUT TEXT                          ${INVITEUSER-EVENT-BUTTON}      ${INV-USER}
    Click element                       ${USER-INVITED}
    click element                       ${TITLE-EVENT-BUTTON}
    INPUT TEXT                          ${TITLE-EVENT-BUTTON}           ${USER-DETAILS1}[passwords]
    Click Element At Coordinates        ${coordinate_x}     ${coordinate_y}
    Click Element                       ${SAVE-CALENDAR-BUTTON}
    Wait Until Page Contains Element    ${BACK-CALENDAR-BUTTON}
    Click Element                       ${BACK-CALENDAR-BUTTON}
    Wait Until Page Contains Element    ${HOME-CALENDAR-BUTTON}
    Click Element                       ${HOME-CALENDAR-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${MAIN-HOME-TAB}

Space Room Reservation
    Go to Space Page
    Make Room Reservation In Space Page
    Make Desk Reservation In Space Page

Go to Space Page
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${SPACE-HOME-BUTTON}
    Click Element                       ${SPACE-HOME-BUTTON}
    Wait Until Page Contains Element    ${SPACE-PAGE-TITLE}

Make Room Reservation In Space Page
    Click Element                       ${FLOOR-SPACE-BUTTON}
    Wait Until Page Contains Element    ${FLOORMENU-SPACE-BUTTON}
    Click Element                       ${FLOORMENU-SPACE-BUTTON}
    Click Element                       ${BUILDING-SPACE-BUTTON}
    Wait Until Page Contains Element    ${BUILDINGMENU-SPACE-BUTTON}
    Click Element                       ${BUILDINGMENU-SPACE-BUTTON}
    Click Element                       ${AMENITY-SPACE-BUTTON}
    Wait Until Page Contains Element    ${AMENITYMENU-SPACE-BUTTON}
    Click Element                       ${AMENITYMENU-SPACE-BUTTON}
    Click Element                       ${AMENITYAPPLY-SPACE-BUTTON}
    Click Element                       ${CAPACITY-SPACE-BUTTON}
    Wait Until Page Contains Element    ${CAPATIVYMENU-SPACE-BUTTON}
    Click Element                       ${CAPATIVYMENU-SPACE-BUTTON}
    Wait Until Page Contains Element    ${SPACENAME-SPACE-BUTTON}
    Click Element                       ${SPACENAME-SPACE-BUTTON}
    Wait Until Page Contains Element    ${SPACEREVIEW-PAGE}
    Click Element                       ${QUICKBOOK-SPACEREVIEW-BUTTON}
    Wait Until Page Contains Element    ${TIME-SPACEPAGE-BUTTON}
    Click Element                       ${TIME-SPACEPAGE-BUTTON}
#    WAIT UNTIL ELEMENT IS VISIBLE       ${VIEW-EVENT}
#    click element                       ${VIEW-EVENT}
#    WAIT UNTIL ELEMENT IS VISIBLE       ${Edit-Event}
#    click element                       ${Edit-Event}
#    WAIT UNTIL ELEMENT IS VISIBLE       ${Text-Edit-page}
#    INPUT TEXT                          ${INVITEUSER-EVENT-BUTTON}      ${INV-USER}
#    Click element                       ${USER-INVITED}
#    click element                       ${TITLE-EVENT-BUTTON}
#    INPUT TEXT                          ${TITLE-EVENT-BUTTON}           ${USER-DETAILS1}[passwords]
#    Click Element At Coordinates        ${coordinate_x}     ${coordinate_y}
#    Click Element                       ${SAVE-EVENT-BUTTON}
    Wait Until Page Contains Element    ${BACK-EDIT}
    click element                       ${BACK-EDIT}

Make Desk Reservation In Space Page
    Wait Until Page Contains Element    ${DESK-SPACE-BUTTON}
    Click Element                       ${DESK-SPACE-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${BUILDING-SPACE-BUTTON}
    Click Element                       ${BUILDING-SPACE-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${BUILDINGMENU-SPACE-BUTTON}
    Click Element                       ${BUILDINGMENU-SPACE-BUTTON}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${FLOOR-SPACE-BUTTON}
    Click Element                       ${FLOOR-SPACE-BUTTON}
    Wait Until Page Contains Element    ${FLOORMENU-SPACE-BUTTON}
    Click Element                       ${FLOORMENU-SPACE-BUTTON}
    wait until page contains element    ${VIEW-FLOOR}
    click element                       ${VIEW-FLOOR}
    WAIT UNTIL PAGE CONTAINS ELEMENT    ${LABEL-DESK}
    click element                       ${LABEL-DESK}
    Wait Until Page Contains Element    ${DESKAVAIL-SPACE-BUTTON}
    Click Element                       ${DESKAVAIL-SPACE-BUTTON}
    Wait Until Page Contains Element    ${QUICKBOOK-SPACE-BUTTON}
    Click Element                       ${QUICKBOOK-SPACE-BUTTON}
    Wait Until Page Contains Element    ${DONE-SPACE-BUTTON}
    Click Element                       ${DONE-SPACE-BUTTON}
    Wait Until Page Contains Element    ${HOME-SPACE-BUTTON}
    Click Element                       ${HOME-SPACE-BUTTON}
#    Wait Until Page Contains Element    ${CANCEL-DESK-HOME-BUTTON}
#    Click Element                       ${CANCEL-DESK-HOME-BUTTON}
#    Wait Until Page Contains Element    ${YES-CANCEL-DESK-BUTTON}
#    Click Element                       ${YES-CANCEL-DESK-BUTTON}
#    Wait Until Page Contains Element    ${DONE-CANCEL-BUTTON}
#    Click Element                       ${DONE-CANCEL-BUTTON}


