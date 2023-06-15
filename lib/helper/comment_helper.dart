import 'package:http/http.dart' as http;
import 'package:jobs_circular_bd/model/comment_model.dart';

class CommentHelper {
  Future<List<CommentModel>?> getComment() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    if (response.statusCode == 200) {
      var data = response.body;
      // print(data);

      return commentModelFromJson(data);
    }
  }
}
