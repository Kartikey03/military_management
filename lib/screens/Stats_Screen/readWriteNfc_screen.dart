import 'package:flutter/material.dart';
import 'package:mhrms/widgets/notifier.dart';
import 'package:mhrms/widgets/dialogs.dart';
import 'package:provider/provider.dart';

class ReadWriteNFCScreen extends StatelessWidget {
  const ReadWriteNFCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NFCNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weapon Management"),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        scanningDialog(context);
                        Provider.of<NFCNotifier>(context, listen: false)
                            .startNFCOperation(nfcOperation: NFCOperation.read);
                      },
                      child: const Text("Scan Weapon")),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       scanningDialog(context);
                  //       Provider.of<NFCNotifier>(context, listen: false)
                  //           .startNFCOperation(
                  //           nfcOperation: NFCOperation.write,
                  //           dataType: "URL");
                  //     },
                  //     child: const Text("WRITE NFC URL")),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       scanningDialog(context);
                  //       Provider.of<NFCNotifier>(context, listen: false)
                  //           .startNFCOperation(
                  //           nfcOperation: NFCOperation.write,
                  //           dataType: "MAIL");
                  //     },
                  //     child: const Text("WRITE NFC EMAIL")),
                  ElevatedButton(
                      onPressed: () {
                        scanningDialog(context);
                        Provider.of<NFCNotifier>(context, listen: false)
                            .startNFCOperation(
                            nfcOperation: NFCOperation.write,
                            dataType: "CONTACT");
                      },
                      child: const Text("Register New Weapon")),
                  Consumer<NFCNotifier>(builder: (context, provider, _) {
                    if (provider.isProcessing) {
                      return const CircularProgressIndicator();
                    }
                    if (provider.message.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pop(context);
                        showResultDialog(context, provider.message);
                      });
                    }
                    return const SizedBox();
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}