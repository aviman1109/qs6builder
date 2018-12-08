var DatabaseIndexRecommend =
{
	doLoad: function()
	{
		var args = {dataSource:clientData.urlArgs.dataSource};
		Utility.invoke("Qs.Misc.getRecommendedDatabaseIndexes", args, true, function(ret) {
			DatabaseIndexRecommend.loadIndexes(ret.data);
		});
	},

	doCreateAll: function()
	{
		var message = $text("Qs.Misc.DatabaseIndexRecommend.CreateAllConfirm");
		Jui.message.confirm(message.replace("${0}", clientData.urlArgs.dataSource), function() {
			var args = {dataSource:clientData.urlArgs.dataSource};
			Utility.invoke("Qs.Misc.createRecommendedDatabaseIndexes", args, true, function(ret) {
				Utility.closeDialog(true);
			});
		});
	},
	
	loadIndexes: function(data)
	{
		if (data.length == 0) {
			var text = $text("Qs.Misc.DatabaseIndexRecommend.NoData");
			$elem("QsContent").innerHTML = "<div class=EmptyMessage>" + text + "</div>";
			return;
		}
		var buffer = [];
		var text = $text("Qs.Misc.DatabaseIndexRecommend.Information");
		buffer.push("<div class=Information>" + text.replace("${0}", clientData.urlArgs.dataSource) + "</div>");
		var table = null;
		for (var i = 0; i < data.length; ++i) {
			var index = data[i];
			if (index.table != table) {
				buffer.push("<div class=Table>" + Jui.$h(index.table) + "</div>");
				table = index.table;
			}
			buffer.push("<div class='Index'>");
			buffer.push("<label class=IndexName>" + Jui.$h(index.name) + "</label>");
			buffer.push("<label class=IndexColumn>(");
			for (var k = 0; k < index.columns.length; ++k) {
				var column = index.columns[k];
				if (k > 0) {
					buffer.push(", ");
				}
				buffer.push(column.name);
				if (column.desc) {
					buffer.push(" desc");
				}
			}
			buffer.push(")</label>");
			buffer.push("</div>");
		}
		$elem("QsContent").innerHTML = buffer.join("");
	}
};
