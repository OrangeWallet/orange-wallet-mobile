import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:ckbcore/base/bean/thin_block.dart';
import 'package:ckbcore/base/bean/thin_transaction.dart';
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
          SizedBox(height: 10),
          StreamBuilder<BlocksProvider>(
            initialData: blocksProvider,
            stream: Provide.stream<BlocksProvider>(context),
            builder: (context, blocksProvider) {
              final List<ThinBlock> blocks = blocksProvider.data.thinBlocks;
              return Container(
                height: 310,
                width: 130,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                  itemCount: blocks.length,
                  itemBuilder: (context, index) {
                    final ThinBlock thinBlock = blocks[index];
                    return buildListItem(thinBlock);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildListItem(ThinBlock thinBlock) {
    final timeStamp =
        DateFormat('HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(int.parse(thinBlock.thinHeader.timestamp)));
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                thinBlock.thinHeader.number,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(timeStamp),
            ],
          ),
          Text(
            thinBlock.thinHeader.hash,
            style: TextStyle(fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 5),
              height: 30,
              child: ListView.builder(
                itemCount: thinBlock.thinTrans.length,
                itemBuilder: (context, index) {
                  ThinTransaction thinTransaction = thinBlock.thinTrans[index];
                  final transResult = thinTransaction.capacityIn - thinTransaction.capacityOut;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        thinTransaction.hash,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: <Widget>[
                          transResult > 0
                              ? Icon(
                                  Icons.call_received,
                                  color: Colors.green,
                                  size: 16,
                                )
                              : Icon(
                                  Icons.call_made,
                                  color: Colors.red,
                                  size: 16,
                                ),
                          SizedBox(width: 5),
                          Text(
                            transResult.abs().toString(),
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Divider()
                    ],
                  );
                },
              )),
          SizedBox(height: 3),
          Divider()
        ],
      ),
    );
  }
}
