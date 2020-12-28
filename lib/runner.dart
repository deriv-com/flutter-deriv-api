import 'dart:io';

Future<void> main(List<String> arguments) async {


    final result = await Process.run('ls',['-a']);
    print(result.stdout.toString());


}


void testFunc() async{

}