String token = "";
String deviceToken = "";
String deviceId = "";
String platformType = "android";
String currentUserId = "";
String currentTruckId = "";
String currentSelectedCityName = "City";
String currentSelectedCityId = "";
String currentUserType = userTypeText;
const String userTypeText = "parent";
double currentLat = 24.73249699423792;
double currentLong = 46.6723563213589;
String newCurrentLat = 'newCurrentLat';
String newCurrentLong = 'newCurrentLong';
String currentAddress = "";
bool isLocationOpened = false;
bool isTruckOwnerApproved = true;
bool showLocationAlertDialog = true;
bool isTruckOwnerWaitingToReview = true;
bool isTruckDataSubmittedCompletely = false;
String deliveryAddressFromMap = "Select location";
double deliveryLatFromMap = 0.0;
double deliveryLongFromMap = 0.0;
List temporaryCart = [];
List productIdsAndSizesInTemporaryCartList = [];
List productsWillBeOrdered = [];

/*
if logged in view home screen if not.. 
then view login screen 
after login  , it saved with true value in shared prefs
*/
bool isLoggedIn = false;

/*
 to control viewing select 
lang screen for only one time 
it saved with true value
after selecting language
*/
bool? isLanguageSelectedForTheFirstTime = false;
/*
after viewing intro screen for the first time
this variable will be set to true
and will be saved with true value in sharedPrefs,
and check that var in splash screen 
as long as this var is true ,  intro will not be seen any more 
*/
bool isIntroScreenViewedForTheFirstTime = false;
/*depending on these variables
some parts of the design will be shown and hidden
according to business requirements */
const bool isThisAppVersionWithRating = false;
const bool isThisAppVersionWithFavorite = false;
const bool thisVersionOfAppWithReviews = false;
