import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../modules/google_home_page.dart';

class GoogleController extends GetxController{
  GoogleSignIn googleSignIn = GoogleSignIn(clientId: "1089618010432-6gtrejn6ci8njl1j4mn1r4v96thbkacg.apps.googleusercontent.com");
  GoogleSignInAccount? _googleUser;

  googleLogin()async{
   try{
    var result = await googleSignIn.signIn();

    if(result != null){
      Get.to(()=>const HomePage());
    }
    print(result);
    print(result!.email);
    print(result.displayName);
    print(result.photoUrl);
    print("${result.id}");

    _googleUser = await googleSignIn.signInSilently() ?? await googleSignIn.signIn();

    // var token = (await googleSignIn.currentUser!.authentication).idToken;
    // print("token :- $token");

    print("google signing successful");
    var userAuth = await _googleUser?.authentication;
    print("userTokenData idToken :${userAuth?.idToken}");
    print("userTokenData accessToken :${userAuth?.accessToken}");
    print("google signing successful");
   }   catch(e){
     print("ERROR----->>e");
   }
 }
// ((1-->Create project google cloud console ))------------------>
//---->google cloud console---->select project[google cloud ni bajuma left side]---->new project-->name ---->create---->select

// ((2-->Create pop up google menu ))------------------>
// --->search oauth consent screen--->select------>select external--->name---->gmail---->developer gmail-->next next-->create-->back to dashboard

// ((3-->credential create-connect flutter app with package and sha key))------------------>
//---->credential create--->select app type-like android--package name--->sha key
 googleLogOut()async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    try{
      googleSignIn.signOut();
      print("-----------LogOut");
    }
    catch(e){
      print("ERROR::::$e");
    }
 }

}