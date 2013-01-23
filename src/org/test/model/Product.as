package org.test.model
{
	import mx.data.utils.Managed;
	
	import org.granite.meta;
	import org.granite.tide.IEntityManager;
	
	use namespace meta;

	[Managed]
	[RemoteClass(alias="org.test.model.Product")]
	public class Product {
				
		[Transient]
		meta var entityManager:IEntityManager = null;
		
		meta function isInitialized(name:String = null):Boolean {
			return true;
		}
		
		meta function defineProxy3(obj:* = null):Boolean {
			return false;          
		}
		
		private var _pid:Number;
		private var _uid:String;
		private var _name:String;
		private var _price:Number;
		
		[Id]
		public function get pid():Number {
			return _pid;
		}
		public function set pid(value:Number):void {
			_pid = value;
		}
		
		public function get uid():String {
			return _uid;
		}
		public function set uid(value:String):void {
			_uid = value;
		}

		public function get name():String {
			return _name;
		}
		public function set name(value:String):void {
			_name = value;
		}
		
		public function get price():Number {
			return _price;
		}
		public function set price(value:Number):void {
			_price = value;
		}

		meta function merge(em:IEntityManager, obj:*):void {
			var src:Product = Product(obj);
			em.meta_mergeExternal(src._pid, _pid, null, this, 'pid', function setter(o:*):void{_pid = o as Number}, false);
			em.meta_mergeExternal(src._uid, _uid, null, this, 'uid', function setter(o:*):void{_uid = o as String}, false);
			em.meta_mergeExternal(src._name, _name, null, this, 'name', function setter(o:*):void{_name = o as String}, false);
			em.meta_mergeExternal(src._price, _price, null, this, 'price', function setter(o:*):void{_price = o as Number}, false);
		}
	}
}