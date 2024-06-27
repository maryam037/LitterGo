# LitterGO - AI Powered Flutter Mobile Application For Detection And Management Of Litter Dumps Using Computer Vision 
LitterGo aims to address the issue of litter dumps in neighborhoods. The solution involves citizens creating
accounts on the app and report litter dumps in their neighborhood. They provide details
about the dump and its location. A drone is employed to visit the specified location
provided by the user. It captures an image of the litter dump at the site. The project
utilizes Computer vision pretrained model that uses image processing technique object detection, to identify and analyze large litter
dumps in the images captured by the drone to automate detection process. The mobile
application is designed with a user-friendly interface, making it easy for both users who
report litter and the cleaning teams to interact with the platform. Users can track the
progress of their reported cases for cleanup. Management efforts over time are visualized, 
allowing for a better understanding of the situation. Information about litter dump
locations, images, cleanup progress, and timestamps are stored in a Firebase database for
efficient management and tracking. Users have the option to provide feedback, which can
further enhance the effectiveness of the cleanup efforts. The solution combines
technology, community engagement, and data management to tackle the problem of litter
dumps in neighborhoods. It empowers individuals to take part in efforts to maintain a
cleaner environment and aligns with broader initiatives for a cleaner Pakistan

## USER MANUAL
User Manual
User Manual shows guidance of system to its users. It provides bird’s eye view of the complete system, and also how system will react upon specific actions. User guide of the intended application is given below.
A.1	Introduction
This user manual will help the users on how to use AI powered hybrid mobile application for detection and management of Litter dumps named as LitterGo.. I will be giving step by step instructions along with screenshots for the ease of users. I will be demonstrating the steps on Android emulator but same steps can be followed for an IOS device as well.

A.2	Splash screen
Splash screen is the first screen that the user will see when they start the LitterGo. From this screen the user can either click on login button that will take them to the login screen or the register button that will take them to the registration screen.
 
A.3	Register screen
This is the account registration screen where the user will enter their username, authentic email and password. The user cannot click the register button unless all text fields are filled. If the user is already registered they can click the already have an account question and they will navigate to login screen.
 
A.4	Email verification screen
Once the user submits the information required for registration they navigate to this screen automatically. They are advised to open email account to verify their account. If they have not received any email they should click the button given below otherwise continue to login.
 
A.5	Email
The user will get an email with the verification link as shown. When the user clicks the verification link it shows them a tab with message that the email has been verified.

A.6	Login screen
This is the login screen where the user enters the previously registered and verified email and password in order to use the app. If they don not have an account yet they can click that question link which will redirect them to register screen.
 
A.8	Make User Profile screen
The user needs to make their profile in order to report. User needs to upload an image of themselves from the gallery. User should enter first name, last name, address, phone number. User can select if they want to receive notifications and if they want to organize a cleaning action and click submit button.
 
A.9	View User Profile screen
When the user clicks the submit button they can view the user profile they made and choose to edit profile information or continue.
 
A.10	LitterGo Dashboard screen
This is the Main screen of LitterGo where the map is interactive that displays all reported locations as markers, user can press button to view completed and in progress reports of other users with brief details in a horizontal scrollable list. The blue add button is used to report a new litterdump.
 
A.11	Report info screen
This is the information gathering screen regarding the litter dump that has been spotted by the user. The user is asked the size, type, accessibility of the litter dump. Along with any additional information about it. After selecting the most suitable option user can submit the report information.

A.12	Report Location screen
The user can see and interact with the maps to choose the location of the litterdump they have reported information about previously. Once the user pins a location the longitudes and latitudes coordinates are captured by the app. User can click submit button when they have selected the most precise location.

 
A.13	Detecting Litterdump screen
In this screen a user captured image will be uploaded from the gallery until then the process cannot go further. When the user uploads the image it is displayed immediately and the server response is shown within a few secnds. The most important things shown in the response is Predictions: giving us x,y, width, height, confidence and class. If the confidence is above 0.40 then it is considered as detected. Which then let’s the user to navigate to next screens. Otherwise user is asked to report again.

A.14	Tracking screen
In tracking screen which is the last screen before completion of the report, the transparency is shown to the user that they can view the disposal waste site, their own reported site along with real time location of cleaning truck. When the cleaning truck has completed the route
from reported site to disposal site the cleaning is completed.
 
A.15	Feedback screen
This is the last screen of Littergo. Here the user is asked to provide feedback after the completion of the report. How much user rates the experience, If they are satisfied with cleaning, if they will report again and if they have any additional comments. When they submit the feedback they are shown a pop-up saying Thank you for your feedback, after pressing Ok they are navigated back to LitterGo Dashboard screen.
 
![m1](https://github.com/maryam037/LitterGo/assets/82705267/8b7b400b-9043-4cd5-a935-0f562a037a28)


