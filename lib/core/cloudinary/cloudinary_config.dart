
import 'package:crisent_pannel/core/cloudinary/cloudinary_keystore.dart';

class CloudinaryConfig {
  static late String cloudName;
  static late String apiKey;
  static late String apiSecret;

  static void initialize() {
   cloudName = CloudinaryKeystore.cloudName;
   apiKey = CloudinaryKeystore.apiKey;
   apiSecret = CloudinaryKeystore.apiSecret;
  }
}