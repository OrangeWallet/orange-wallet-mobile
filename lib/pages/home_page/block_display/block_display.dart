import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:ckbcore/base/bean/thin_block.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              final List<ThinBlock> blocks = blocksProvider.data.thinBlocks;
              return Container(
                height: 330,
                width: 130,
                child: ListView.builder(
                  itemCount: blocks.length,
                  itemBuilder: (context, index) {
                    final ThinBlock thinBlock = blocks[index];
                    final timeStamp = DateFormat('yyyy-MM-dd HH:mm:ss')
                        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(thinBlock.thinHeader.timestamp)));
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(timeStamp),
                              SizedBox(width: 10),
                              Text(thinBlock.thinHeader.number),
                            ],
                          ),
                          Text(thinBlock.thinHeader.hash),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
