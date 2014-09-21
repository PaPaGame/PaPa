package view.itemRender
{
	import com.shrimp.framework.ui.container.HBox;
	import com.shrimp.framework.ui.controls.ItemRender;
	import com.shrimp.framework.ui.controls.Label;
	import com.shrimp.framework.utils.ColorUtil;
	
	import flash.display.DisplayObjectContainer;
	
	import model.vo.FileItemData;
	
	/**
	 * 文件列表项渲染器
	 * @author Sol
	 * 
	 */
	public class FileItemRender extends ItemRender
	{
		public function FileItemRender(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
		{
			super(parent, xpos, ypos);
		}

		private var lblName:Label;
		private var lblStatus:Label;

		private var info:FileItemData;

		override protected function createChildren():void
		{
			super.createChildren();
			var hb:HBox = new HBox(this);

			lblName = new Label(hb);
			lblStatus = new Label(hb);
		}

		override public function set data(value:*):void
		{
			super.data = value;
			info = value as FileItemData;
			if (!info)
			{
				return;
			}

			lblName.text = info.name;
			//画背景色
			var color:uint = index % 2 ? 0xC0C0C0 : 0x0C0C0C;
			with (this)
			{
				graphics.beginFill(color, .2);
				graphics.drawRect(0, 0, 300, 20);
				graphics.endFill();
			}
		}

		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			lblStatus.text = info.status == 1 ? "√" : "×";
			lblStatus.color = info.status == 1 ? ColorUtil.RGB_RED : ColorUtil.RGB_GREEN;
		}
		
		public function updateState(state:int):void
		{
			info.status = state;
			invalidateDisplayList();
		}
	}
}
