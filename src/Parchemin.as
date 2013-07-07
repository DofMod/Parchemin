package
{
	import d2api.PlayedCharacterApi;
	import d2api.SystemApi;
	import d2api.UiApi;
	import d2hooks.EnabledChannels;
	import flash.display.Sprite;
	import ui.PostitUI;
	
	/**
	 * ...
	 * @author Sabotaz
	 */
	public class Parchemin extends Sprite
	{
		//::///////////////////////////////////////////////////////////
		//::// Variables
		//::///////////////////////////////////////////////////////////
		
		protected var postitUI:PostitUI;
		
		public var uiApi:UiApi;
		public var sysApi:SystemApi;
		public var playerApi:PlayedCharacterApi;
		
		//::///////////////////////////////////////////////////////////
		//::// Méthodes publiques
		//::///////////////////////////////////////////////////////////
		
		public function main():void
		{
			if (!(sysApi.isInGame()))
			{
				sysApi.addHook(EnabledChannels, onChatStart);
			}
			else
			{
				onChatStart();
			}
		}
		
		//::///////////////////////////////////////////////////////////
		//::// Evenements
		//::///////////////////////////////////////////////////////////
		
		public function onChatStart(args:Object = null):void
		{
			uiApi.loadUi("postit", "postit", null, 3);
		}
	}
}
