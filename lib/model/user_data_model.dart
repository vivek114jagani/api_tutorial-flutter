
import 'package:json_annotation/json_annotation.dart';
part 'user_data_model.g.dart';
@JsonSerializable()
class UserDataModel {
    String name;
    String job;
    DateTime updatedAt;

    UserDataModel({
        required this.name,
        required this.job,
        required this.updatedAt,
    });
factory UserDataModel.fomJson(Map<String,dynamic> json)=>_$UserDataModelFromJson(json);

  Map<String, dynamic> toJson(UserDataModel movie)=>_$UserDataModelToJson(this);
}
