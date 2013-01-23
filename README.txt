Example usage of client conversations with the Tide framework

The project demonstrates the following behaviour :

- A main mxml application which contains a tab navigator
- The main pane of the navigator contains a list of products
- A click on a product opens a new tab with a product view in a conversation scope
- The save button merges the modified product and closes the tab
- The cancel button simply closes the tab, discarding any change on the object

The process is the following :

A click on the DataGrid dispatches a conversation event with a conversationId built from "product#" + productId.
If the conversation does not exist, a new one is created, else the existing one is used.
A global observer for the Tide event 'org.granite.tide.contextCreate' is defined in the main application and is called for each new conversation.
It gets the view from the context with 'event.context.byType(IView, true)', assuming here that the view implements IView, and adds it to the tab navigator.
A conversation scoped controller named 'productController' receives the event in its openProduct method annotated with [Observer("openProduct")].
The controller puts the received product in its own variable and publishes it in its context with the [Out] annotation.
The view is updated with the product with [In].
The save button dispatches an event of type 'saveProduct' which is received by the controller.
In this case, the controller calls a mock remote service ProductService and ends the conversation when the service returns, merging all modified data in the global context with context.meta_merge(true).
The cancel button dispatches an event of type 'saveProduct' which is received by the controller.
In this case, the controller simply ends the conversation without merging modified data with context.meta_end(false).
A global observer for the Tide event 'org.granite.tide.contextDestroy' catched the end of the conversation and removes the view from the tab navigator.
