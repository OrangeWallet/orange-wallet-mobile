import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

class BlockDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocksProvider = Provide.value<BlocksProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Blocks',
            style: Theme.of(context).textTheme.display1.copyWith(fontSize: 26),
          ),
          StreamBuilder<BlocksProvider>(
            initialData: blocksProvider,
            stream: Provide.stream<BlocksProvider>(context),
            builder: (context, blocksProvider) {
              return Text(blocksProvider.data.thinBlocks.length.toString());
            },
          )
        ],
      ),
    );
  }
}
