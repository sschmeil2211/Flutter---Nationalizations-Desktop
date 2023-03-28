import 'package:flutter/material.dart';

import 'package:nationalizations/constants/constants.dart';
import 'package:nationalizations/widgets/widgets.dart';

class DashboardContent extends StatelessWidget {

  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding : const EdgeInsets.all(appPadding),
      child   : Column(
        children: [
          const SizedBox(height: appPadding),
          Column(
            children: [
              Row(
                crossAxisAlignment : CrossAxisAlignment.start,
                children           : [
                  Expanded(
                    flex  : 5,
                    child : Column(
                      children: [
                        const ResponsiveAnalyticCards(),
                        const SizedBox(height: appPadding),
                        const BarGraphic(),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: appPadding),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment : CrossAxisAlignment.start,
                children           : [
                  Expanded(
                    flex  : 5,
                    child : Column(
                      children: [
                        const SizedBox(height: appPadding),
                        Row(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children           : [
                            const Expanded(
                              flex  : 3,
                              child : LineGraphic(graphicTitle: "Clients per Month"),
                            ),
                            const SizedBox(width: appPadding),
                            if (!Responsive.isMobile(context))
                              const Expanded(
                                flex  : 2,
                                child : PieGraphic(),
                              ),
                          ],
                        ),
                        const SizedBox(height: appPadding),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: appPadding),
                        if (Responsive.isMobile(context))
                          const PieGraphic(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
