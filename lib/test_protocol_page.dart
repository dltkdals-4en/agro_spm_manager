import 'package:agro_spm_manager/providers/protocol_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contstants/constants.dart';
import 'contstants/screen_size.dart';

class TestProtocolPage extends StatelessWidget {
  const TestProtocolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prProvider = Provider.of<ProtocolProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo/copick_GRBL.png',
          fit: BoxFit.cover,
          height: 22,
        ),
        leading: IconButton(
          color: AppColors.black,
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(NORMALGAP),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 3,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.lightPrimary),
              ),
              child: Text(''),
            ),
            NorH,
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('preOperation'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('endOperation'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('getSensorData'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('connectSensor'),
                  ),
                  SmH,
                  Container(
                    width: size.width,
                    child: TextField(
                      controller: prProvider.anyProtocol,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.lightPrimary,
                            width: 2,
                          ),
                        ),
                        focusColor: AppColors.lightPrimary,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('any protocol'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
