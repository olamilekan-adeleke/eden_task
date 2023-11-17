# Eden task ReadMe

Please read the steps below

# How to set up the Project

Create a `.env` file containing the Ably Api Key like so.

``` evn
ABLY_API_KEY=tTWy2Q.1sp1J.....
```
After that, everything should be ready to go.

# How to send a message from Ably Console
- Make sure you have created an App already.
  
- Login to your Ably Dev Console and navigate to the `Dev Console` section
  
  <img width="1054" alt="Screenshot 2023-11-17 at 11 01 43" src="https://github.com/olamilekan-adeleke/eden_task/assets/64818550/db80eef6-9818-4025-90c6-dfa96959635c">

- Next scroll to the Channels section and click Add Channel.

  **Note:** Use the channel name `eden_order_timeline` Please be sure you use the channel name `eden_order_timeline` 

   <img width="1082" alt="Screenshot 2023-11-17 at 11 05 18" src="https://github.com/olamilekan-adeleke/eden_task/assets/64818550/91dbe4a3-6914-4d64-9a8d-868eb079d53e">

  <img width="1054" alt="Screenshot 2023-11-17 at 11 05 46" src="https://github.com/olamilekan-adeleke/eden_task/assets/64818550/1383f0e3-0902-44a2-9d27-a59a5f1cbe06">

- Now that you have connected to the channel, the possible order status is below.
  ```
  order_placed,
  order_accepted,
  order_pick_up_in_progress,
  order_on_the_way_to_customer,
  order_arrived,
  order_delivered
  ```
  
  ``` dart
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
  ```
You can send any of the order statuses as a message by entering any one of them in the Message data field and clicking the Publish Message button. To keep things simple, we are leaving the event name blank. See below.

<img width="1015" alt="Screenshot 2023-11-17 at 11 12 11" src="https://github.com/olamilekan-adeleke/eden_task/assets/64818550/6b2b571b-2ec3-43a2-978a-ff978b14ba5e">

You should be able to see the status update in real time in the app.



# Extra (Optional)

So I noticed that when I restarted the APK and navigated to the Order Page, the channel didn’t remember the last message sent; there was no persistence.

After reading their documentation more, I found a way to enable and implement persistent so I can get the channel history and pass messages, but there is a step to add that; it involves setting up a few rules on the [Ably Dev Console](https://ably.com/accounts/44473/apps/71842/console). Follow the screenshot below.

- First, hop back to your Ably Dev console and navigate to the Settings
  
  <img width="1057" alt="Screenshot 2023-11-17 at 11 23 05" src="https://github.com/olamilekan-adeleke/eden_task/assets/64818550/31e4def8-d203-489a-aefa-304e111e9399">

- Then scroll to the Channel Rules section and click on the Add New Rule button.

  <img width="1028" alt="Screenshot 2023-11-17 at 11 27 23" src="https://github.com/olamilekan-adeleke/eden_task/assets/64818550/cb6b332b-d8c4-4367-a104-28993e755038">

- Select the option below and click create channel rules.
  
**Note: Please use the channel name `eden_order_timeline` as this is what the app listens for.**

  <img width="886" alt="Screenshot 2023-11-17 at 11 27 51" src="https://github.com/olamilekan-adeleke/eden_task/assets/64818550/cb515139-fcc1-4b47-a920-b239b8d4a9ab">




































