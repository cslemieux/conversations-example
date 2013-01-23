package org.test.control
{
	import mx.controls.Alert;
	
	import org.granite.tide.events.TideContextEvent;
	import org.granite.tide.events.TideResultEvent;
	import org.test.model.Product;
	import org.test.service.ProductService;
	import org.test.view.ProductView;

	[Name("productController", scope="conversation", autoCreate="true")]
	public class ProductController {
		
		// Published the current product in the conversation context
		[Bindable] [Out]
		public var product:Product;
		
		// Injects an instance of the product service proxy
		[Inject]
		public var productService:ProductService;
		
		// Received when the conversation is started
		[Observer("openProduct")]
		public function openProduct(product:Product):void {
			this.product = product;
		}
		
		// Received when 
		[Observer("saveProduct")]
		public function saveProduct():void {
			productService.saveProduct(product, saveProductResult);
		}
		
		[Observer("cancelProduct")]
		public function cancelProduct(event:TideContextEvent):void {
			event.context.meta_end(false);
		}
		
		private function saveProductResult(event:TideResultEvent):void {
			Alert.show("Product " + product.name + " saved");
			event.context.meta_end();
		}
	}
}