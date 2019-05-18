import 'package:OrangeWallet/bean/thin_block_with_transaction.dart';
import 'package:OrangeWallet/utils/provide/blocks_notifier.dart';
import 'package:ckbcore/base/bean/thin_block.dart';
import 'package:ckbcore/base/bean/thin_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provide/provide.dart';

class BlockDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocksCurrent = Provide.value<BlocksProvider>(context);
    return StreamBuilder<BlocksProvider>(
        initialData: blocksCurrent,
        stream: Provide.stream<BlocksProvider>(context),
        builder: (context, blocksProvider) {
          final List<ThinBlockWithTransaction> blocks = blocksProvider.data.thinBlocks;
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      blocksProvider.data.onlyShowBlocksWithTransaction ? 'Transactions' : 'Blocks',
                      style: Theme.of(context).textTheme.display1.copyWith(fontSize: 26),
                    ),
                    Switch(
                        value: blocksProvider.data.onlyShowBlocksWithTransaction,
                        onChanged: (value) {
                          blocksCurrent.changeDisplay(value);
                        }),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 310,
                  width: 130,
                  child: ListView.builder(
                    itemCount: blocks.length,
                    itemBuilder: (context, index) {
                      final ThinBlock thinBlock = blocks[index];
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: buildListItem(thinBlock),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget buildListItem(ThinBlockWithTransaction thinBlock) {
    final timeStamp = DateFormat('HH:mm:ss')
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(thinBlock.thinHeader.timestamp)));
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
          SizedBox(height: 5),
          Text(
            thinBlock.thinHeader.hash,
            style: TextStyle(fontSize: 14),
          ),
          thinBlock.thinTrans.length <= 0
              ? Container()
              : Container(
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
                                thinBlock.thinTransDisplay[index].balance +
                                    " " +
                                    thinBlock.thinTransDisplay[index].uint,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  )),
        ],
      ),
    );
  }
}
