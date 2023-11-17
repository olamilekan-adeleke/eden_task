enum OrderStatus {
  orderPlaced,
  orderAccepted,
  orderPickUpInProgress,
  orderOnTheWayToCustomer,
  orderArrived,
  orderDelivered,
  unknown,
}

OrderStatus stringToOrderStatus(String value) {
  switch (value) {
    case 'order_placed':
      return OrderStatus.orderPlaced;
    case 'order_accepted':
      return OrderStatus.orderAccepted;
    case 'order_pick_up_in_progress':
      return OrderStatus.orderPickUpInProgress;
    case 'order_on_the_way_to_customer':
      return OrderStatus.orderOnTheWayToCustomer;
    case 'order_arrived':
      return OrderStatus.orderArrived;
    case 'order_delivered':
      return OrderStatus.orderDelivered;
    default:
      return OrderStatus.unknown;
  }
}

extension OrderStatusExtension on OrderStatus {
  bool isGreater(OrderStatus other) {
    final orderMap = {
      OrderStatus.unknown: 0,
      OrderStatus.orderPlaced: 1,
      OrderStatus.orderAccepted: 2,
      OrderStatus.orderPickUpInProgress: 3,
      OrderStatus.orderOnTheWayToCustomer: 4,
      OrderStatus.orderArrived: 5,
      OrderStatus.orderDelivered: 6,
    };

    final int thisOrder = orderMap[this] ?? -1;
    final int otherOrder = orderMap[other] ?? -1;
    return thisOrder > otherOrder;
  }

  String get title {
    switch (this) {
      case OrderStatus.orderPlaced:
        return 'Order Placed Successfully';
      case OrderStatus.orderAccepted:
        return 'Order Accepted and Processing';
      case OrderStatus.orderPickUpInProgress:
        return 'Order Pick Up In Progress';
      case OrderStatus.orderOnTheWayToCustomer:
        return 'Order On The Way To You';
      case OrderStatus.orderArrived:
        return 'Order Successfully Arrived';
      case OrderStatus.orderDelivered:
        return 'Order Delivered Successfully';
      case OrderStatus.unknown:
        return 'Unknown Order Status';
    }
  }

  String get description {
    switch (this) {
      case OrderStatus.orderPlaced:
        return 'Your order has been successfully placed. We are preparing your items with care.';
      case OrderStatus.orderAccepted:
        return 'Great news! Your order has been accepted, and we are getting it ready for you.';
      case OrderStatus.orderPickUpInProgress:
        return 'Our team is currently picking up your order. Rest assured, it will be on its way to you soon!';
      case OrderStatus.orderOnTheWayToCustomer:
        return 'Exciting news! Your order is now on its way to you. We appreciate your patience.';
      case OrderStatus.orderArrived:
        return 'Hooray! Your order has arrived at its destination. We hope you enjoy your items!';
      case OrderStatus.orderDelivered:
        return 'Congratulations! Your order has been successfully delivered. We hope you love your purchase!';
      case OrderStatus.unknown:
        return 'We couldn\'t determine the status of your order at the moment. Please contact customer support for assistance.';
    }
  }

  String get helperMessage {
    return 'If you have any questions or concerns, feel free to contact our customer support. We are here to assist you!';
  }
}
