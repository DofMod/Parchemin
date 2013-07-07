package utils
{
	/**
	 * ...
	 * @author Sabotaz
	 */
	
	import d2api.SystemApi;
	import flash.utils.Dictionary;
	
	public class Data
	{
		public var nomPersonnage:String;
		public var indiceMax:int;
		public var nombreMessages:int;
		public var listeMessages:Dictionary;
		
		public var sysApi:SystemApi;
		
		public function Data(sysApi_:SystemApi, nomPersonnage_:String)
		{
			nomPersonnage = nomPersonnage_;
			sysApi = sysApi_;
			
			listeMessages = sysApi.getData(nomPersonnage);
			if (listeMessages == null)
			{
				listeMessages = new Dictionary();
				nombreMessages = 0;
				indiceMax = 0;
			}
			else
			{
				nombreMessages = 0;
				indiceMax = 0;
				for (var key:*in listeMessages)
				{
					nombreMessages++;
					if (key > indiceMax)
					{
						indiceMax = key;
					}
				}
			}
		
		}
		
		public function saveData(numero:int, message:String):void
		{
			listeMessages[numero] = message;
			indiceMax = numero;
			sysApi.setData(nomPersonnage, listeMessages);
			nombreMessages++;
			if (nombreMessages > 25)
			{
				deletData();
			}
		}
		
		private function deletData():void
		{
			var indiceMin:int = indiceMax;
			for (var key:*in listeMessages)
			{
				nombreMessages++;
				if (key < indiceMin)
				{
					indiceMin = key;
				}
			}
			
			delete listeMessages[indiceMin];
			sysApi.setData(nomPersonnage, listeMessages);
			nombreMessages--;
		}
	}
}