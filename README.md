# ODC Hackathon Application.

As a part of Orange's Digital Center Hackathon, it was focused on the developement on FinTech based applications. 

(Backend integration has been removed for display purposes, server is down)
## Application's main features:

Send and Request money to and from other users.
Creating a Virtual Card that can be used to purchase with on other websites.
OTP required to confirm purchase using the virtual card.
Displaying user's transaction history.
Making sure there is a continous secure internet connection while using the application.






## Packages & Plugins Used: 
SharedPreferences used to store the access token locally and the device and fetch it when needed.
Connectivity_Plus: Used to check the client's internet connection and used to guard the application against network time outs.
easy_splashScreen: Used to create the splash screen.
gesture_passwordwidget: Used for the creation of the pattern required when session has expired and required to re-engage. (Session expires if the application was disconencted from the internet or was out of focus for more than 3 seconds).
pin_code_fields: Used for entering the OTP received by the user.
coursal_slider: Used for horizontal sliding displaying cards containing (Income,Outcome & Balance).

scan_qr: Used for scanning QR codes of other accounts. (It was supposed to be another mean to send and request funds).


# Main Functionalities:
(Login & Register):

In the Login and Register pages, a validation function is used in the phone number input field, containing a Regex to check if the number entered is indeed an Egyptian phone number.

In the password input fields as well, a validation checks if the input contains numbers only else it displays an error.

(Session expiration after Out of Focus for more than 5 seconds):


(Connection Checking):
checkConnectivity: It is used for checking the stream of connection.




![loginValidation](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/528aafaf-a414-42d1-89c3-08a5c5a6fcbc)
![signUpChild](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/de608b0c-7984-4965-bc6b-0716887e5510)
![SignUpParent](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/adcff62a-100b-4210-8e29-69fea7638825)

![homeScreen](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/629783d4-259b-4150-aa71-b01586956f1a)
![SendReceiveScreen](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/425828ba-4340-4aed-a39d-efb0ed068dd2)
Balance exceeding availiable balance.
![SendDenied](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/966a4005-b1e0-446d-be86-1b2328de1259)

![SendAccepted](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/18f92e98-9651-4cd9-a0b9-10e54eb2cd56)



![requestSuccess](https://github.com/Sabra-xD/OrangeHackathon/assets/52329758/5511d4a8-de8a-450c-855c-b7e995be4ad4)
