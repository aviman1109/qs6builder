var DatabaseIndexManage =
{
	doLoad: function()
	{
		var dsItems = [];
		for (var i = 0, ds = clientData.dataSources; i < ds.length; ++i) {
			dsItems.push({text:ds[i]});
		}
		toolBar.getItem("DataSource").loadItems(dsItems);
		toolBar.getItem("DataSource").setValue(clientData.dataSourceId);
		DatabaseIndexManage.doRefresh();
	},

	doDataSourceChange: function()
	{
		DatabaseIndexManage.doRefresh();
	},

	doIndexTypeChange: function()
	{
		DatabaseIndexManage.doRefresh();
	},

	doRecommend: function()
	{
		var args = {dataSource:toolBar.getItem("DataSource").getValue()};
		Utility.openDialog("Qs.Misc.DatabaseIndexRecommend.page", args, null, function() {
			Jui.message.hint($text("Public.OperationSuccess"));
			DatabaseIndexManage.doRefresh();
		});
	},
	
	doRefresh: function()
	{
		var args = {dataSource:toolBar.getItem("DataSource").getValue()};
		Utility.invoke("Qs.Misc.getDatabaseIndexes", args, true, function(ret) {
			DatabaseIndexManage.loadIndexes(ret.data);
		});
	},
	
	loadIndexes: function(data)
	{
		var indexType = toolBar.getItem("IndexType").getValue() || "Normal";
		var buffer = [];
		for (var i = 0; i < data.length; ++i) {
			var item = data[i];
			if (indexType != "All") {
				var hasVisibleItem = false;
				for (var j = 0; j < item.indexes.length; ++j) {
					var index = item.indexes[j];
					var isKey = index.keyType == "P" || index.keyType == "U";
					if (indexType == "Normal" && !isKey || indexType == "Key" && isKey) {
						hasVisibleItem = true;
						break;
					}
				}
				if (!hasVisibleItem) {
					continue;
				}
			}
			buffer.push("<div class=Table>" + Jui.$h(item.table) + "</div>");
			item.indexes.sort(function(a, b) {
				if (a.keyType == b.keyType) {
					return a.name == b.name ? 0 : (a.name < b.name ? -1 : 1);
				}
				var x = a.keyType == "P" ? 1 : (a.keyType == "U" ? 2 : 3);
				var y = b.keyType == "P" ? 1 : (b.keyType == "U" ? 2 : 3);
				return x - y;
			});
			for (var j = 0; j < item.indexes.length; ++j) {
				var index = item.indexes[j];
				var isKey = index.keyType == "P" || index.keyType == "U";
				if (indexType == "Normal" && isKey || indexType == "Key" && !isKey) {
					continue;
				}
				var keyClass = index.keyType == "P" ? "PrimaryKey" : (index.keyType == "U" ? "Unique" : "");
				buffer.push("<div class='Index " + keyClass + "'>");
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
		}
		if (buffer.length == 0) {
			var text = $text("Qs.Misc.DatabaseIndexManage.NoData");
			$elem("QsContent").innerHTML = "<div class=EmptyMessage>" + text + "</div>";
		}
		else {
			$elem("QsContent").innerHTML = buffer.join("");
		}
	}
};
