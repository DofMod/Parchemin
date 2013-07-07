package ui
{
	/**
	 * ...
	 * @author Sabotaz
	 */
	
	import d2api.PlayedCharacterApi;
	import d2api.SystemApi;
	import d2api.UiApi;
	import d2components.ButtonContainer;
	import d2components.GraphicContainer;
	import d2components.Input;
	import d2components.Label;
	import d2components.TextArea;
	import d2components.Texture;
	import d2hooks.MouseClick;
	import utils.Data;
	import utils.TailleChatEnum;
	
	public class PostitUI
	{
		public var sysApi:SystemApi;
		public var uiApi:UiApi;
		public var playerApi:PlayedCharacterApi;
		
		public var postitCtr:GraphicContainer;
		public var textarea_postit:TextArea;
		public var input_postit:Input;
		public var btn_postit:ButtonContainer;
		public var btn_menu_postit:ButtonContainer;
		public var tx_fond1:Texture;
		public var tx_fond2:Texture;
		public var label_save:Label;
		
		private var _tailleContainer:int;
		private var _data:Data;
		private var _sauvegarde:Boolean;
		private var _indice:int;
		
		public function main(args:Object):void
		{
			_tailleContainer = TailleChatEnum.PETIT;
			var playerInfo:Object = playerApi.getPlayedCharacterInfo();
			
			_sauvegarde = false;
			
			_data = new Data(sysApi, playerInfo["name"]);
			
			_indice = _data.indiceMax;
			
			textarea_postit.appendText("Bienvenue " + playerInfo["name"] + ".");
			textarea_postit.appendText("Nombre de messages sauvegardés : " + _data.nombreMessages + "/25.");
			
			uiApi.addShortcutHook("validUi", onShortcut);
			sysApi.addHook(MouseClick, onMouseClick);
			loadMessages();
		
		}
		
		public function unload():void
		{
		
		}
		
		public function onRelease(target:Object):void
		{
			if (target.name == "btn_postit")
			{
				postitCtr.visible = !(postitCtr.visible);
			}
			else if (target.name == "btn_menu_postit")
			{
				_sauvegarde = !(_sauvegarde);
				if (_sauvegarde)
				{
					label_save.text = "(S)";
				}
				else
				{
					label_save.text = "";
				}
			}
		}
		
		public function onShortcut(s:String):Boolean
		{
			if (s == "validUi" && input_postit.lastTextOnInput != "" && input_postit.lastTextOnInput != null)
			{
				var lastInput:String = input_postit.lastTextOnInput;
				input_postit.text = "";
				_indice++;
				if (_sauvegarde)
				{
					textarea_postit.appendText("[#" + _indice + "][SAVE] " + lastInput);
				}
				else
				{
					textarea_postit.appendText("[#" + _indice + "] " + lastInput);
				}
				
				textarea_postit.scrollV = textarea_postit.maxScrollV;
				
				if (_sauvegarde)
				{
					_data.saveData(_indice, lastInput);
				}
				return false;
			}
			return true;
		}
		
		public function onMouseClick(target:Object):void
		{
			if (target.name == "strata_0")
			{
				if (target.parent.name == "btn_resize")
				{
					if (_tailleContainer == TailleChatEnum.PETIT)
						_tailleContainer = TailleChatEnum.MOYEN
					else if (_tailleContainer == TailleChatEnum.MOYEN)
						_tailleContainer = TailleChatEnum.GRAND
					else
						_tailleContainer = TailleChatEnum.PETIT
					
					_resizeContainer();
					
				}
			}
		
		}
		
		private function _resizeContainer():void
		{
			if (_tailleContainer == TailleChatEnum.PETIT)
			{
				postitCtr.y = 2;
				textarea_postit.height = 113;
				tx_fond1.height = 136;
				tx_fond2.y = 0;
				input_postit.y = 111;
				btn_menu_postit.y = 112;
				label_save.y = 109;
				
			}
			else if (_tailleContainer == TailleChatEnum.MOYEN)
			{
				postitCtr.y = -98;
				textarea_postit.height = 213;
				tx_fond1.height = 236;
				tx_fond2.y = 100;
				input_postit.y = 211;
				btn_menu_postit.y = 212;
				label_save.y = 209;
			}
			else
			{
				postitCtr.y = -398;
				textarea_postit.height = 513;
				tx_fond1.height = 536;
				tx_fond2.y = 400;
				input_postit.y = 511;
				btn_menu_postit.y = 512;
				label_save.y = 509;
			}
			
			textarea_postit.scrollV = textarea_postit.maxScrollV;
		}
		
		public function loadMessages():void
		{
			for (var key:*in _data.listeMessages)
			{
				textarea_postit.appendText("[#" + key + "][SAVE] " + _data.listeMessages[key]);
				textarea_postit.scrollV = textarea_postit.maxScrollV;
			}
		}
	}
}