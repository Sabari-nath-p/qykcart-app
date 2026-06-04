import 'package:flutter/material.dart';

void main() => runApp(const QykKartApp());

class QykKartApp extends StatelessWidget {
  const QykKartApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QYK KART',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1A7A3C),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
    );
  }
}

const kGreen = Color(0xFF1A7A3C);
const kGreenLight = Color(0xFFE8F5EE);
const kGreenDark = Color(0xFF145C2D);
const kOrange = Color(0xFFE65100);
const kOrangeLight = Color(0xFFFFF3E0);
const kRed = Color(0xFFC62828);
const kRedLight = Color(0xFFFCE4EC);
const kBlue = Color(0xFF1565C0);
const kBlueLight = Color(0xFFE3F0FD);
const kBlueBorder = Color(0xFF90CAF9);
const kGreenBorder = Color(0xFFAED581);

// ─── Models ───────────────────────────────────────────────────────────────────

class StatItem {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String label;
  final String value;
  final String? sub;
  final bool isPositive;
  final bool hasLink;
  const StatItem({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.value,
    this.sub,
    this.isPositive = false,
    this.hasLink = false,
  });
}

class QuickAction {
  final IconData icon;
  final String label;
  final bool isPrimary;
  const QuickAction(this.icon, this.label, {this.isPrimary = false});
}

class OverviewItem {
  final String label;
  final String value;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final List<double> spark;
  final Color sparkColor;
  const OverviewItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.spark,
    required this.sparkColor,
  });
}

class OrderItem {
  final String id;
  final String time;
  final String name;
  final String items;
  final String amount;
  final String payment;
  final String status;
  const OrderItem({
    required this.id,
    required this.time,
    required this.name,
    required this.items,
    required this.amount,
    required this.payment,
    required this.status,
  });
}

// ─── Data ─────────────────────────────────────────────────────────────────────

final stats = [
  const StatItem(
    icon: Icons.shopping_bag_outlined,
    iconBg: kGreenLight,
    iconColor: kGreen,
    label: "Today's Orders",
    value: '28',
    sub: '12% vs yesterday',
    isPositive: true,
  ),
  const StatItem(
    icon: Icons.access_time_outlined,
    iconBg: kOrangeLight,
    iconColor: kOrange,
    label: 'Pending Orders',
    value: '16',
    hasLink: true,
  ),
  const StatItem(
    icon: Icons.account_balance_wallet_outlined,
    iconBg: kGreenLight,
    iconColor: kGreen,
    label: 'Revenue Today',
    value: '₹18,450',
    sub: '18% vs yesterday',
    isPositive: true,
  ),
  const StatItem(
    icon: Icons.inventory_2_outlined,
    iconBg: kRedLight,
    iconColor: kRed,
    label: 'Products',
    value: '142',
    hasLink: true,
  ),
];

final quickActions = [
  const QuickAction(Icons.add, 'Add Product', isPrimary: true),
  const QuickAction(Icons.list_alt_outlined, 'Orders'),
  const QuickAction(Icons.people_outline, 'Customers'),
  const QuickAction(Icons.bar_chart_outlined, 'Analytics'),
  const QuickAction(Icons.local_offer_outlined, 'Offers'),
  const QuickAction(Icons.settings_outlined, 'Store Settings'),
];

final overviewItems = [
  const OverviewItem(
    label: 'Total Orders',
    value: '28',
    icon: Icons.shopping_cart_outlined,
    iconBg: kGreenLight,
    iconColor: kGreen,
    spark: [16, 12, 14, 8, 10, 6],
    sparkColor: kGreen,
  ),
  const OverviewItem(
    label: 'Delivered',
    value: '12',
    icon: Icons.check_circle_outline,
    iconBg: kGreenLight,
    iconColor: kGreen,
    spark: [18, 14, 16, 10, 8, 6],
    sparkColor: kGreen,
  ),
  const OverviewItem(
    label: 'Cancelled',
    value: '2',
    icon: Icons.cancel_outlined,
    iconBg: kRedLight,
    iconColor: kRed,
    spark: [8, 14, 10, 16, 12, 18],
    sparkColor: Colors.redAccent,
  ),
  const OverviewItem(
    label: 'Avg. Order Value',
    value: '₹658',
    icon: Icons.trending_up,
    iconBg: kGreenLight,
    iconColor: kGreen,
    spark: [16, 12, 10, 8, 10, 6],
    sparkColor: kGreen,
  ),
];

final orders = [
  const OrderItem(
    id: '#QYK12580',
    time: '10:30 AM · May 24',
    name: 'Rahul Kumar',
    items: '12 Items',
    amount: '₹1,245',
    payment: 'Online Payment',
    status: 'New',
  ),
  const OrderItem(
    id: '#QYK12579',
    time: '10:15 AM · May 24',
    name: 'Priya Singh',
    items: '8 Items',
    amount: '₹876',
    payment: 'COD',
    status: 'Packing',
  ),
  const OrderItem(
    id: '#QYK12578',
    time: '09:45 AM · May 24',
    name: 'Amit Verma',
    items: '15 Items',
    amount: '₹2,034',
    payment: 'Online Payment',
    status: 'Out for Delivery',
  ),
  const OrderItem(
    id: '#QYK12577',
    time: '09:20 AM · May 24',
    name: 'Neha Gupta',
    items: '6 Items',
    amount: '₹598',
    payment: 'COD',
    status: 'Delivered',
  ),
];

// ─── Main Screen ──────────────────────────────────────────────────────────────

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F2),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroBanner(),
            const SizedBox(height: 8),
            _StatsRow(),
            const SizedBox(height: 8),
            _QuickActionsSection(),
            const SizedBox(height: 8),
            _OverviewSection(),
            const SizedBox(height: 8),
            _RecentOrdersSection(),
            const SizedBox(height: 8),
            _GrowBanner(),
            const SizedBox(height: 8),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.black87),
        onPressed: () {},
      ),
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: kGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'QYK KART',
                style: TextStyle(
                  color: kGreen,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                '— Your Shop, Your Way —',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 8.5,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.black54),
              onPressed: () {},
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('3', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFFC8D8C0),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const Icon(Icons.store_outlined, color: kGreen, size: 18),
        ),
        IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_outlined, 'label': 'Home', 'badge': 0},
      {'icon': Icons.inventory_2_outlined, 'label': 'Products', 'badge': 0},
      {'icon': Icons.shopping_bag_outlined, 'label': 'Orders', 'badge': 16},
      {'icon': Icons.donut_large_outlined, 'label': 'Analytics', 'badge': 0},
      {'icon': Icons.grid_view_outlined, 'label': 'More', 'badge': 0},
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 0.5)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) {
              final it = items[i];
              final active = _navIndex == i;
              return GestureDetector(
                onTap: () => setState(() => _navIndex = i),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(it['icon'] as IconData,
                            color: active ? kGreen : Colors.grey, size: 22),
                        if ((it['badge'] as int) > 0)
                          Positioned(
                            top: -5,
                            right: -8,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '${it['badge']}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      it['label'] as String,
                      style: TextStyle(
                        fontSize: 9.5,
                        color: active ? kGreen : Colors.grey,
                        fontWeight: active ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ─── Hero Banner ──────────────────────────────────────────────────────────────

class _HeroBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kGreenDark, kGreen, Color(0xFF2EA855)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Good Morning,',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 2),
                const Text('Shop Owner 👋',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text("Here's what's happening with your store today.",
                    style: TextStyle(color: Colors.white70, fontSize: 10)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                            color: kGreen, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 6),
                      const Text('Store is Online',
                          style: TextStyle(
                              color: kGreen,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down,
                          color: kGreen, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _BasketIllustration(),
        ],
      ),
    );
  }
}

class _BasketIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 75,
      child: CustomPaint(painter: _BasketPainter()),
    );
  }
}

class _BasketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..style = PaintingStyle.fill;

    // basket body
    p.color = const Color(0xFFC0392B).withOpacity(0.9);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(8, size.height * 0.5, size.width - 16, size.height * 0.5),
          const Radius.circular(6)),
      p,
    );

    // basket accent strip
    p.color = const Color(0xFFA93226);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(14, size.height * 0.5, size.width - 28, 5),
          const Radius.circular(2)),
      p,
    );

    // produce: green leaves
    p.color = const Color(0xFF27AE60);
    canvas.drawOval(Rect.fromCenter(
        center: Offset(22, size.height * 0.38), width: 20, height: 24), p);

    // yellow pepper
    p.color = const Color(0xFFF39C12);
    canvas.drawOval(Rect.fromCenter(
        center: Offset(size.width / 2, size.height * 0.28), width: 24, height: 28), p);

    // red tomato
    p.color = const Color(0xFFE74C3C);
    canvas.drawOval(Rect.fromCenter(
        center: Offset(size.width - 22, size.height * 0.38), width: 20, height: 24), p);

    // milk bottle (white)
    p.color = Colors.white.withOpacity(0.92);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(size.width / 2 - 4, 6, 10, 22),
          const Radius.circular(3)),
      p,
    );
    // bottle cap
    p.color = const Color(0xFF27AE60);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(size.width / 2 - 3, 4, 8, 6),
          const Radius.circular(2)),
      p,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─── Stats Row ────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: stats
            .map((s) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: _StatCard(s),
                  ),
                ))
            .toList()
          ..last = Expanded(child: _StatCard(stats.last)),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final StatItem s;
  const _StatCard(this.s);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                color: s.iconBg, borderRadius: BorderRadius.circular(8)),
            child: Icon(s.icon, color: s.iconColor, size: 16),
          ),
          const SizedBox(height: 6),
          Text(s.label,
              style: const TextStyle(fontSize: 9, color: Colors.grey),
              textAlign: TextAlign.center),
          const SizedBox(height: 2),
          Text(s.value,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A)),
              textAlign: TextAlign.center),
          const SizedBox(height: 2),
          if (s.isPositive && s.sub != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.trending_up, color: kGreen, size: 9),
                const SizedBox(width: 1),
                Flexible(
                  child: Text(s.sub!,
                      style: const TextStyle(fontSize: 8, color: kGreen),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            )
          else if (s.hasLink)
            const Text('View all ›',
                style: TextStyle(fontSize: 8, color: kGreen)),
        ],
      ),
    );
  }
}

// ─── Quick Actions ────────────────────────────────────────────────────────────

class _QuickActionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Quick Actions',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: quickActions.map((qa) => _QAItem(qa)).toList(),
      ),
    );
  }
}

class _QAItem extends StatelessWidget {
  final QuickAction qa;
  const _QAItem(this.qa);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: qa.isPrimary ? kGreen : kGreenLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(qa.icon,
              color: qa.isPrimary ? Colors.white : kGreen, size: 18),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 46,
          child: Text(qa.label,
              style: const TextStyle(fontSize: 8.5, color: Color(0xFF444444)),
              textAlign: TextAlign.center,
              maxLines: 2),
        ),
      ],
    );
  }
}

// ─── Overview ─────────────────────────────────────────────────────────────────

class _OverviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Today's Overview",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A))),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    const Text('Today',
                        style: TextStyle(fontSize: 11, color: Colors.grey)),
                    const Icon(Icons.keyboard_arrow_down,
                        size: 14, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: overviewItems
                .map((o) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: _OverviewCard(o),
                      ),
                    ))
                .toList()
              ..last = Expanded(child: _OverviewCard(overviewItems.last)),
          ),
        ],
      ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final OverviewItem o;
  const _OverviewCard(this.o);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(o.label,
              style: const TextStyle(fontSize: 8, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 3),
          Text(o.value,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A))),
          const SizedBox(height: 3),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
                color: o.iconBg, borderRadius: BorderRadius.circular(11)),
            child: Icon(o.icon, color: o.iconColor, size: 12),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 22,
            child: CustomPaint(
              painter: _SparklinePainter(o.spark, o.sparkColor),
              child: const SizedBox(width: double.infinity),
            ),
          ),
        ],
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> points;
  final Color color;
  const _SparklinePainter(this.points, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final maxV = points.reduce((a, b) => a > b ? a : b);
    final minV = points.reduce((a, b) => a < b ? a : b);
    final range = maxV - minV == 0 ? 1.0 : maxV - minV;
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final x = i / (points.length - 1) * size.width;
      final y = (1 - (points[i] - minV) / range) * size.height;
      if (i == 0) path.moveTo(x, y);
      else path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─── Recent Orders ────────────────────────────────────────────────────────────

class _RecentOrdersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Recent Orders',
      action: const Text('View All ›',
          style: TextStyle(
              fontSize: 11, color: kGreen, fontWeight: FontWeight.w600)),
      child: Column(
        children: orders.map((o) => _OrderRow(o)).toList(),
      ),
    );
  }
}

class _OrderRow extends StatelessWidget {
  final OrderItem o;
  const _OrderRow(this.o);

  (Color bg, Color tc, Color? border) _statusStyle() {
    switch (o.status) {
      case 'New':
        return (kGreenLight, kGreen, null);
      case 'Packing':
        return (kOrangeLight, kOrange, null);
      case 'Out for Delivery':
        return (kBlueLight, kBlue, kBlueBorder);
      case 'Delivered':
        return (const Color(0xFFF1F8E9), const Color(0xFF558B2F), kGreenBorder);
      default:
        return (Colors.grey.shade100, Colors.grey, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (bg, tc, border) = _statusStyle();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.grey.shade100, width: 0.5)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 68,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(o.id,
                    style: const TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A))),
                const SizedBox(height: 2),
                Text(o.time,
                    style: const TextStyle(fontSize: 8, color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(o.name,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A))),
                Text(o.items,
                    style: const TextStyle(fontSize: 9, color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(o.amount,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A))),
                Text(o.payment,
                    style: const TextStyle(fontSize: 9, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(7),
              border: border != null
                  ? Border.all(color: border, width: 0.5)
                  : null,
            ),
            child: Text(o.status,
                style: TextStyle(
                    fontSize: 8.5, color: tc, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(width: 2),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}

// ─── Grow Banner ──────────────────────────────────────────────────────────────

class _GrowBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FAF4),
        border: Border.all(color: const Color(0xFFD0EEDD)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFD0EEDD),
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                const Icon(Icons.store_outlined, color: kGreen, size: 22),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Grow your business',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A))),
                SizedBox(height: 2),
                Text('Share your store link and get more customers.',
                    style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFC0DDC8)),
            ),
            child: const Row(
              children: [
                Icon(Icons.share_outlined, color: kGreen, size: 13),
                SizedBox(width: 4),
                Text('Share Store',
                    style: TextStyle(
                        fontSize: 10,
                        color: kGreen,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Shared Section Card ──────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? action;
  const _SectionCard(
      {required this.title, required this.child, this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A))),
              if (action != null) action!,
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}