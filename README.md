# Give Livly
Final year Flutter Project for Donation

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# UI for the App
- Figma Link here down Here 
    [Figma](https://www.figma.com/file/qnNvZKXq2P4LZmq0TV9Hkm/GiveLivly-UI?node-id=0%3A1)
- Colors : **Color Scheme**
    ![alt text](https://github.com/ratneshgujarathi/GiveLivly/blob/master/light_theme_UI_colors/Color.png)
# What we Do ?

## Requirements
**Users App Module**
  - Login permissions (Login functionalities)
      * Login (for administrators)
      * Login (for normal people)
  - Register
      * Registration (for everyone)

**Client Side Main App Module**
## Onboarding -- Selection whether to go for cloths donation/receive or Food donation/receive 
### Food donation App Module
  - Add Food item to donate
    - Time that is auto created when post is received
    - Delete the post after 6 hours so to maintain hygiene and space issue
    - Place location fetch by users address book
    - Name of owner who is donating food
  - Recieve food item
    * Filtered by location,time,etc
    * Authenticated people can only receive food for data security issue (for future)
### Cloth donation App Module 
  - Add cloth item to donate
   * Receive or not saved in database (checkbox) or boolean
   * If received then delete post or pushed down
   * Time auto created whenever post is made
   * Address fetch by address book 
        Set address visibility to authenticated users when admin will accept request of genuine people only
 - Recieve cloth item
   * Filter availability location wise, time wise, etc
   * Had to make request for receiving donation which is accepted by either admins or maybe with the post makers whether they want to give their addres*s



