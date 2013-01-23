package org.test.service
{
	import flash.utils.flash_proxy;
	
	import mx.rpc.AsyncToken;
	
	import org.granite.tide.Component;
	import org.granite.tide.ITideResponder;
	import org.granite.tide.events.TideResultEvent;
	import org.test.model.Product;
	
	use namespace flash_proxy;
	
	[RemoteClass(alias="org.test.service.ProductService")]
	public class ProductService extends Component {
		
		public function saveProduct(product:Product, resultHandler:Object = null, faultHandler:Function = null):void {
			delete meta_context.meta_getSavedProperties()[product];
			resultHandler(new TideResultEvent(TideResultEvent.RESULT, this.meta_context, false, false, null, null, product));
		}
	}
}