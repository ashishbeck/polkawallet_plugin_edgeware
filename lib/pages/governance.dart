import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polkawallet_plugin_edgeware/pages/governance/council/councilPage.dart';
import 'package:polkawallet_plugin_edgeware/pages/governance/democracy/democracyPage.dart';
import 'package:polkawallet_plugin_edgeware/pages/governance/treasury/treasuryPage.dart';
import 'package:polkawallet_plugin_edgeware/utils/i18n/index.dart';
import 'package:polkawallet_sdk/plugin/index.dart';
import 'package:polkawallet_sdk/utils/i18n.dart';
import 'package:polkawallet_ui/components/entryPageCard.dart';
import 'package:polkawallet_ui/pages/dAppWrapperPage.dart';

class Gov extends StatelessWidget {
  Gov(this.plugin);

  final PolkawalletPlugin plugin;

  @override
  Widget build(BuildContext context) {
    final dic = I18n.of(context).getDic(i18n_full_dic_edgeware, 'gov');
    final dicCommon = I18n.of(context).getDic(i18n_full_dic_edgeware, 'common');

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    I18n.of(context)
                        .getDic(i18n_full_dic_edgeware, 'common')['governance'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: plugin.sdk.api.connectedNode == null
                  ? Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 2),
                      child: Column(
                        children: [
                          CupertinoActivityIndicator(),
                          Text(dicCommon['node.connecting']),
                        ],
                      ),
                    )
                  : ListView(
                      padding: EdgeInsets.all(16),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            child: EntryPageCard(
                              dic['democracy'],
                              dic['democracy.brief'],
                              Icon(
                                Icons.event_note,
                                color: Colors.white,
                                size: 56,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            onTap: () => Navigator.of(context)
                                .pushNamed(DemocracyPage.route),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            child: EntryPageCard(
                              dic['council'],
                              dic['council.brief'],
                              Icon(
                                Icons.people_outline,
                                color: Colors.white,
                                size: 56,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            onTap: () => Navigator.of(context)
                                .pushNamed(CouncilPage.route),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            child: EntryPageCard(
                              dic['treasury'],
                              dic['treasury.brief'],
                              Icon(
                                Icons.account_balance,
                                color: Colors.white,
                                size: 56,
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            onTap: () => Navigator.of(context)
                                .pushNamed(TreasuryPage.route),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            child: EntryPageCard(
                              'Commonwealth',
                              dic['commonwealth.im'],
                              Image.asset(
                                'packages/polkawallet_plugin_edgeware/assets/images/public/hero_icon.png',
                                width: 56,
                              ),
                              color: Color(0xFFF56A20),
                            ),
                            onTap: () => Navigator.of(context).pushNamed(
                              DAppWrapperPage.route,
                              arguments: 'https://commonwealth.im/edgeware',
                              // "https://polkadot.js.org/apps/",
                            ),
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
