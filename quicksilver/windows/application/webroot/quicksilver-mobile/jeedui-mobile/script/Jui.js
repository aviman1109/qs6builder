var Jui = 
{
	$p: function(pairs)
	{
		var text = " ";
		for (var key in pairs) {
			var value = pairs[key];
			if (value != null) {
				text += key + "='" + ("" + value).replace(/&/g, "&amp;").replace(/\>/g, "&gt;") + "' ";
			}
		}
		return text;
	},
	
	$h: function(s, replaceWhiteSpace)
	{
		if (s == null) {
			return "";
		}
		if (typeof(s) != "string") {
			s = s + "";
		}
		s = s.replace(/&/g, "&amp;")
			.replace(/\>/g, "&gt;")
			.replace(/\</g, "&lt;")
			.replace(/\'/g, "&#39;")
			.replace(/\"/g, "&quot;")
			.replace(/\n/g, "<br>");
		return replaceWhiteSpace ? s.replace(/ /g, "&nbsp;") : s;
	},
	
	$s: function()
	{
		var styles = [];
		for (var i = arguments.length - 1; i >= 0; --i) {
			var arg = arguments[i];
			if (typeof(arg) == "string" && !Jui.string.isEmpty(arg)) {
				styles = styles.concat(arg.split(";"));
			}
			else if (typeof(arg) == "object" && arg != null) {
				for (var property in arg) {
					if (arg[property] != null) {
						styles.push(property + ":" + arg[property]);
					}
				}
			}
		}
		return styles.length == 0 ? null : styles.join(";");
	},
	
	$define: function(className, superClass, mixins)
	{
		var holder = window;
		var parts = className.split(".");
		for (var i = 0; i < parts.length - 1; ++i) {
			var part = parts[i];
			if (holder[part] == null) {
				holder[part] = {};
			}
			holder = holder[part]; 
		}
		
		var clazz = function(){};
		if (superClass != null) {
			Jui.object.merge(clazz, superClass, true);
			clazz.prototype = new superClass();
		}
		if (mixins != null) {
			for (var i = 0; i < mixins.length; ++i) {
				var mixin = mixins[i];
				Jui.object.merge(clazz, mixin, false);
				Jui.object.merge(clazz.prototype, mixin.prototype, false);
			}
		}
		clazz.superClass = superClass;
		clazz.toString = function(){return "class " + className;};
		holder[parts[parts.length - 1]] = clazz;
	},
	
	$bind: function(instance, element)
	{
		instance.element = element;
		if (element != null) {
			element._owner = instance;
		}
	},
	
	$unbind: function(instance)
	{
		var element = instance.element;
		delete instance.element;
		if (element != null) {
			delete element._owner;
		}
	},

	$owner: function(element, className)
	{
		var e = element;
		if (e == null) {
			try {
				e = event.srcElement;				
			}
			catch (e) {
				console.log(Jui.util.getCallStack());
				throw e;
			}
		}
		while (e != null && (e._owner == null || className != null && e.className.indexOf(className) == -1)) {
			e = e.parentElement;
		}
		return e && e._owner;
	}
};

//------------------------------------------------------------------------
// string
//------------------------------------------------------------------------

Jui.string =
{
	isEmpty: function(string)
	{
		return string == null || /^\s*$/.test(string);
	},

	trim: function(s)
	{
		if (s == null) {
			return null;
		}
		else if (typeof(s) == "string") {
			return s.replace(/^\s+|\s+$/g, "");
		}
		else {
			return s + "";
		}
	},

	repeat: function(value, count)
	{
		var buffer = [];
		for (var i = 0; i < count; ++i) {
			buffer.push(value);
		}
		return buffer.join("");
	},

	upperFirstLetter: function(string)
	{
		if (Jui.string.isEmpty(string)) {
			return string;
		}
		return string.substring(0, 1).toUpperCase() + string.substring(1);
	}
};

//------------------------------------------------------------------------
// object
//------------------------------------------------------------------------

Jui.object =
{
	isEmpty: function(object)
	{
		if (object != null) {
			for (var property in object) {
				if (property != null) { // eliminate eclispe warning
					return false;
				}
			}
		}
		return true;
	},

	remove: function(object)
	{
		for (var i = 1; i < arguments.length; ++i) {
			delete object[arguments[i]];
		}
		return object;
	},

	merge: function(target)
	{
		var lastArg	= arguments[arguments.length - 1];
		var replace	= lastArg == true;
		var count	= arguments.length - (typeof(lastArg) == "boolean" ? 2 : 1);
		for (var i = 0; i < count; ++i) {
			var object = arguments[1 + i];
			if (object != null) {
				for (var p in object) {
					if (replace || !(p in target)) {
						target[p] = object[p];
					}
				}
			}
		}
		return target;
	}
};

//------------------------------------------------------------------------
// array
//------------------------------------------------------------------------

Jui.array =
{
	isEmpty: function(array)
	{
		return array == null || array.length == 0;
	},

	isArray: function(value)
	{
		try {
			return value != null && typeof(value) == "object" && "splice" in value && "unshift" in value;
		}
		catch (e) {
			return value != null && typeof(value.length) == "number";
		}
	},

	insert: function(array, index, value)
	{
		for (var i = array.length; i > index; --i) {
			array[i] = array[i - 1];
		}
		array[index] = value;
	},
	
	wrap: function(iterable)
	{
		var array = [];
		for (var i = 0; i < iterable.length; ++i) {
			array.push(iterable[i]);
		}
		return array;
	},

	contains: function(array, value)
	{
		for (var i = 0; i < array.length; ++i) {
			if (array[i] == value) {
				return true;
			}
		}
		return false;
	},

	remove: function(array, item)
	{
		for (var i = array.length - 1; i >= 0; --i) {
			if (array[i] == item) {
				array.splice(i, 1);
			}
		}
		return array;
	},

	extractProperty: function(array, property)
	{
		var ret = [];
		for (var i = 0; i < array.length; ++i) {
			ret.push(array[i][property]);
		}
		return ret;
	},

	wrapAsProperty: function(array, property)
	{
		var ret = [];
		for (var i = 0; i < array.length; ++i) {
			var item = {};
			item[property] = array[i];
			ret.push(item);
		}
		return ret;
	},

	transformProperty: function(array, propertyMap)
	{
		var ret = [];
		for (var i = 0; i < array.length; ++i) {
			var item = array[i];
			var newItem = {};
			for (var p in propertyMap) {
				newItem[propertyMap[p]] = item[p];
			}
			ret.push(newItem);
		}
		return ret;
	},

	toSet: function(array, keyProperty)
	{
		var set = {};
		for (var i = 0; i < array.length; ++i) {
			set[keyProperty == null ? array[i] : array[i][keyProperty]] = true;
		}
		return set;
	},

	toMap: function(array, keyProperty)
	{
		var map = [];
		for (var i = 0; i < array.length; ++i) {
			map[array[i][keyProperty]] = array[i];
		}
		return map;
	},
	
	make: function(value)
	{
		return Jui.array.isArray(value) ? value : [value];
	},
	
	numericSort: function(array)
	{
		return array.sort(function(a, b){return parseFloat(a) - parseFloat(b);});
	},
	
	stableSort: function(array, comparer)
	{
		Jui.array._mergeSort(array, 0, array.length, comparer, new Array(array.length));
		return array;
	},

    _mergeSort: function(array, start, end, comparer, temp)
    {
    	if (start < end - 1) {
    		var middle = (start + end) >> 1;
            Jui.array._mergeSort(array, start, middle, comparer, temp);
            Jui.array._mergeSort(array, middle, end, comparer, temp);
            Jui.array._merge(array, start, middle, end, comparer, temp);
    	}
    },
	
    _merge: function(array, start, middle, end, comparer, temp)
    {
        var i = start;
        var j = middle;
        var k = 0;
        while (i < middle && j < end) {
        	var a = array[i];
        	var b = array[j];
            if ((comparer == null && a <= b) || (comparer != null && comparer(a, b) <= 0)) {
            	temp[k++] = array[i++];
            }
            else {
            	temp[k++] = array[j++];
            }
        }
        while (i < middle) {
        	temp[k++] = array[i++];
        }
        while (j < end) {
        	temp[k++] = array[j++];
        }
        for (var m = 0; m < k; ++m) {
        	array[start + m] = temp[m];
        }
    }
};

//------------------------------------------------------------------------
// cast
//------------------------------------------------------------------------

Jui.cast =
{
	toBool: function(value, defaultValue)
	{
		if (value == null) {
			return defaultValue == true;
		}
		return value == true || (typeof(value) == "string" && value.toLowerCase() == "true");
	},

	toDate: function(value)
	{
		switch (value == null ? "undefined" : typeof(value)) {
			case "number":
				return new Date(value);
			case "string":
				return Jui.cast._stringToDate(value);
			case "object":
				return Jui.cast._objectToDate(value);
			default:
				return null;
		}
	},

	toString: function(value, format)
	{
		switch (value == null ? "undefined" : typeof(value)) {
			case "boolean":
				return value.toString();
			case "number":
				return Jui.cast._numberToString(value, format);
			case "string":
				return value;
			case "object":
				return Jui.cast._objectToString(value, format);
			case "function":
				return value.toString();
			default:
				return null;
		}
	},

	toNumber: function(value)
	{
		switch (value == null ? "undefined" : typeof(value)) {
			case "boolean":
				return value ? 1 : 0;
			case "number":
				return value;
			case "string":
				return Jui.cast._stringToNumber(value);
			default:
				return null;
		}
	},

	/**
	 *  toStringWithDigitLength(0.314159, 3) = "0.314"
	 *  toStringWithDigitLength(3.14159, 3) = "3.14"
	 *  toStringWithDigitLength(31.4159, 3) = "31.4"
	 *  toStringWithDigitLength(314.159, 3) = "314"
	 *  toStringWithDigitLength(3141.59, 3) = "3141"
	 *  toStringWithDigitLength(31415.9, 3) = "31415"
	 */
	toStringWithDigitLength: function(number, digitLength)
	{
		if (number == 0) {
			return "0";
		}
		var base = Math.pow(10, digitLength - 1);
		var offset = 0;
		while (number < base) {
			offset++;
			number *= 10;
		}
		var s = (number + "").replace(/\..*/, "");
		var a = s.length <= offset ? "0" : s.substring(0, s.length - offset);
		var b = s.length <= offset ? s : s.substring(s.length - offset);
		while (b.length < offset) {
			b = "0" + b;
		}
		b = b.replace(/0+$/, "");
		return b == "" ? a : a + "." + b;
	},

	toFileSizeText: function(size, removeRedundantZeros)
	{
		if (size == null) {
			return "";
		}
		var units = ["B", "KB", "MB", "GB", "TB", "PB"];
		for (var i = 0; i < units.length; ++i) {
			if (size < 10) {
				var s = Jui.cast.toString(size, "0.00");
				return (removeRedundantZeros ? s.replace(/\.00/, "") : s) + " " + units[i];
			}
			else if (size < 100) {
				var s = Jui.cast.toString(size, "0.0");
				return (removeRedundantZeros ? s.replace(/\.0/, "") : s) + " " + units[i];
			}
			else if (size < 1000 || i == units.length - 1) {
				return Jui.cast.toString(size, "0") + " " + units[i];
			}
			else {
				size = size / 1024;
			}
		}
	},

	_stringToDate: function(value)
	{
		if (value == "now") {
			return new Date();
		}
		//supported format: [yy]yy-[M]M[-[d]d[[H]H:[m]m[:[s]s[.SSS]]]]
		if (!/^(\d\d)?\d\d-\d?\d(-\d?\d( \d?\d:\d?\d(:\d?\d(\.\d*)?)?)?)?$/.test(value)) {
			return null;
		}
		var dt = (value.replace(/\.\d*$/, "") + " 00:00:00").split(" ");
		var d = (dt[0] + "-01").split("-");
		var t = (dt[1] + ":00").split(":");
		for (var i = 0; i < 3; ++i) {
			d[i] = parseInt(d[i].length == 1 ? d[i] : d[i].replace(/^0/, ""));
			t[i] = parseInt(t[i].length == 1 ? t[i] : t[i].replace(/^0/, ""));
		}
		return new Date((d[0] < 100 ? 2000 + d[0] : d[0]), d[1] - 1, d[2], t[0], t[1], t[2]);
	},

	_objectToDate: function(value)
	{
		if (value.constructor.toString() == Date.toString()) {
			return value;
		}
		else {
			return null;
		}
	},

	_numberToString: function(value, format)
	{
		if (format == null) {
			return value.toString();
		}
		var buffer	= [];
		var head	= format.match(/[,0]*(?:\.|$)/)[0].replace(/[,\.]/g, "").length;
		var tail	= format.match(/\.0*|$/)[0].replace(/\./, "").length;
		var group	= format.match(/,[0#]*(?:\.|$)|$/)[0].replace(/[,\.]/g, "").length;
		var flag	= value < 0 ? "-" : "";
		value		= Math.round(Math.abs(value) * Math.pow(10, tail));
		for (var i = 0; i < tail; ++i, value = Math.floor(value / 10)) {
			buffer.push(value % 10);
		}
		if (tail > 0) {
			buffer.push(".");
		}
		for (var i = 0; i < head || value > 0; ++i, value = Math.floor(value / 10)) {
			buffer.push((value % 10) + (i > 0 && i % group == 0 ? "," : ""));
		}
		return flag + buffer.reverse().join("");
	},

	_objectToString: function(value, format)
	{
		if (value.constructor.toString() != Date.toString()) {
			return null;
		}
		if (format == null) {
			format = "yyyy-MM-dd HH:mm:ss";
		}
		var y = value.getFullYear();
		var m = value.getMonth() + 1;
		var d = value.getDate();
		var h = value.getHours();
		var n = value.getMinutes();
		var s = value.getSeconds();
		var w = value.getDay();
		return format.replace("yyyy", y).replace("yy", y % 100 < 10 ? "0" + y % 100 : y % 100)
					 .replace("MM", m < 10 ? "0" + m : m).replace("M", m)
					 .replace("dd", d < 10 ? "0" + d : d).replace("d", d)
					 .replace("HH", h < 10 ? "0" + h : h).replace("H", h)
					 .replace("mm", n < 10 ? "0" + n : n).replace("m", n)
					 .replace("ss", s < 10 ? "0" + s : s).replace("s", s)
					 .replace("ww", Jui.util.getWeekDayName(w, false)).replace("w", Jui.util.getWeekDayName(w, true));
	},

	_stringToNumber: function(value)
	{
		var result = parseFloat(value.replace(/,/g, ""));
		return isNaN(result) ? null : result;
	}
};

//------------------------------------------------------------------------
// util
//------------------------------------------------------------------------

Jui.util =
{
	clone: function(src)
	{
		return Jui.util._clone(src, []);
	},

	coalesce: function()
	{
		for (var i = 0; i < arguments.length; ++i) {
			if (!Jui.string.isEmpty(arguments[i])) {
				return arguments[i];
			}
		}
	},
	
	execute: function(func, target)
	{
		if (func == null) {
			throw new Error("The fuction to execute cannot be null.");
		}
		if (typeof(func) == "string") {
			if (func.indexOf("(") != -1) {
				return eval(func);
			}
			var f = eval(func);
			if (f == null) {
				throw new Error("Function '" + func + "' does not exist.");
			}
			func = f;
		}
		var args = Jui.array.wrap(arguments).slice(2);
		return func.apply(target || window, args);
	},

	alertAndThrow: function(message)
	{
		alert(message);
		throw message;
	},

	getFullUrl: function(url)
	{
		url = Jui.string.trim(url);
		if (!/^http(s?):\/\//i.test(url)) {
			url = "http://" + url;
		}
		return url;
	},

	getWeekDayName: function(index, isShort)
	{
		var key = isShort ? "Jui.ShortWeekDays" : "Jui.LongWeekDays";
		return Jui.i18n.getText(key).split(",")[index];
	},

	_clone: function(src, pairs)
	{
		if (typeof(src) != "object" || src == null) {
			return src;
		}
		else if (src instanceof Date) {
			return new Date(src.getTime());
		}
		for (var i = 0; i < pairs.length; ++i) {
			if (src == pairs[i][0]) {
				return pairs[i][1];
			}
		}
		if (Jui.array.isArray(src)) {
			var array = [];
			pairs.push([src, array]);
			for (var i = 0; i < src.length; ++i) {
				array.push(Jui.util._clone(src[i], pairs));
			}
			return array;
		}
		else {
			//the following code can cause "invoking disposed JavaScript code" in IE when cross frame. 
			//try {object = new src.constructor();} catch (e) {object = {};};
			var object = {};
			pairs.push([src, object]);
			for (var p in src) {
				object[p] = Jui.util._clone(src[p], pairs);
			}
			return object;
		}
	},
	
	getCallStack: function()
	{
		var items = [];
		for (var f = arguments.callee.caller.caller; f != null; f = f.caller) {
			items.push(f.toString().replace(/\s+/g, " "));
		}
		return items.join("\n");
	}
};

//------------------------------------------------------------------------
// math
//------------------------------------------------------------------------

Jui.math =
{
	pointInRange: function(point, rect)
	{
		return point.x >= rect.left && point.x <= rect.right && point.y >= rect.top && point.y <= rect.bottom;
	},

	pointsEqual: function(a, b)
	{
		return a == b || (a != null && b != null && a.x == b.x && a.y == b.y);
	},

	getAngle: function(a, b, c)
	{
		var ab = Jui.math.getPointPointDistance(a, b);
		var bc = Jui.math.getPointPointDistance(b, c);
		var ca = Jui.math.getPointPointDistance(c, a);
		return Math.acos((ab * ab + bc * bc - ca * ca) / (2 * ab * bc));
	},

	getPointPointSlope: function(a, b)
	{
		if (a.x == b.x && a.y == b.y) {
			return 0;
		}
		else if (a.x == b.x) {
			return b.y > a.y ? Math.PI / 2 : -Math.PI / 2;
		}
		else if (a.y == b.y) {
			return b.x > a.x ? 0 : Math.PI;
		}
		else {
			return Math.atan((b.y - a.y) / (b.x - a.x)) + (b.x > a.x ? 0 : Math.PI);
		}
	},

	getPointPointDistance: function(a, b)
	{
		return Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
	},

	getPointLineDistance: function(p, p1, p2)
	{
		if (p1.x == p2.x && p1.y == p2.y) {
			return Jui.math.getPointPointDistance(p, p1);
		}
		var A = p2.y - p1.y;
		var B = p1.x - p2.x;
		var C = p2.x * p1.y - p2.y * p1.x;
		return Math.abs(A * p.x + B * p.y + C) / Math.sqrt(A * A + B * B);
	},

	getPointLineSegmentDistance: function(p, p1, p2)
	{
		if (p1.x == p2.x && p1.y == p2.y) {
			return Jui.math.getPointPointDistance(p, p1);
		}
		else if (Jui.math.getAngle(p, p1, p2) > Math.PI / 2) {
			return Jui.math.getPointPointDistance(p, p1);
		}
		else if (Jui.math.getAngle(p, p2, p1) > Math.PI / 2) {
			return Jui.math.getPointPointDistance(p, p2);
		}
		else {
			return Jui.math.getPointLineDistance(p, p1, p2);
		}
	}
}; 

//------------------------------------------------------------------------
// random
//------------------------------------------------------------------------

Jui.random =
{
	_letters: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	
	_hex_digits: '0123456789abcdef'.split(''),
		
	_sumEventX: 0,
	
	_sumEventY: 0,

	_serial: 0,

	_initTime: new Date().getTime(),
	
	// Chrome/FF/Edge supports crypto, IE11 supports msCrypto, IE10 supports none
	_crypto: window.crypto || window.msCrypto,
	
	/**
	 * Generate a random float number. range = [0, 1)
	 */
	next: function()
	{
		//in JavaScript, the max integer is Math.pow(2, 53) - 1
		var ints = Jui.random._nextIntegers();
		var a = ints[0] ^ ints[1];
		var b = ints[2] ^ ints[3];
		var c = a & 0x1FFFFFF; // 25 bits
		var d = b & 0xFFFFFFF; // 28 bits
		return (c * 0x10000000 + d) / (0x1FFFFFF * 0x10000000 + 0xFFFFFFF);
	},
	
	/**
	 * Generate a random integer. range = [0, upperBound)
	 */
	nextInt: function(upperBound)
	{
		var ints = Jui.random._nextIntegers();
		var value = ints[0] ^ ints[1] ^ ints[2] ^ ints[3];
		if ((upperBound || 0) > 0) {
			return (value & 0x7FFFFFFF) % upperBound;
		}
		else {
			return value;
		}
	},
	
	/**
	 * Generate a random string.
	 * example:
	 *     Jui.random.nextString(2, 8, "0123456789")
	 *     Jui.random.nextString(6, 6, "abcdef")
	 */
	nextString: function(minLength, maxLength, characters)
	{
		if (minLength == null) {
			minLength = 3;
		}
		if (maxLength == null) {
			maxLength = 10;
		}
		if (characters == null) {
			characters = Jui.random._letters;
		}
		var n = minLength == maxLength ? minLength : minLength + Jui.random.nextInt(maxLength - minLength + 1);
		var buffer = [];
		for (var i = 0; i < n; ++i) {
			buffer.push(characters.charAt(Jui.random.nextInt(characters.length)));
		}
		return buffer.join("");
	},

	/**
	 * Generate a random UUID (version=4)
	 */
	nextUuid: function()
	{
		var bytes = Jui.random._nextBytes();
		bytes[6] = 0x40 | (bytes[6] & 0xF);
		var splitters = [4, 6, 8, 10];
		var buffer = [];
		for (var i = 0; i < bytes.length; ++i) {
			var byte = bytes[i];
			if (i == 4 || i == 6 || i == 8 || i == 10) {
				buffer.push("-");
			}
			buffer.push(Jui.random._hex_digits[(byte >> 4) & 0xF]);
			buffer.push(Jui.random._hex_digits[byte & 0xF]);
		}
		return buffer.join("");
	},
	
	/**
	 * IE 10 does not support window.crypto/window.msCrypto, use mouse event as random seed
	 */
	doMouseMove: function(event)
	{
		Jui.random._sumEventX = (Jui.random._sumEventX + event.screenX) % 0x7FFFFFFF;
		Jui.random._sumEventY = (Jui.random._sumEventY + event.screenY) % 0x7FFFFFFF;
	},

	_nextIntegers: function()
	{
		if (Jui.random._crypto == null) {
			return Jui.md5.asIntegers(Jui.random._getHashTarget());
		}
		var ints = new Int32Array(4);
		Jui.random._crypto.getRandomValues(ints);
		return ints;
	},

	_nextBytes: function()
	{
		if (Jui.random._crypto == null) {
			return Jui.md5.asUint8Array(Jui.random._getHashTarget());
		}
		var bytes = new Uint8Array(16);
		Jui.random._crypto.getRandomValues(bytes);
		return bytes;
	},
	
	_getHashTarget: function()
	{
		var parts = [];
		parts.push(new Date().getTime());
		parts.push(Jui.random._serial++);
		parts.push(Jui.random._sumEventX);
		parts.push(Jui.random._sumEventY);
		return parts.join("");
	}
};

//------------------------------------------------------------------------
// event
//------------------------------------------------------------------------

Jui.event =
{
	preventDefault: function()
	{
		if (event.preventDefault) {
			event.preventDefault();
		}
		else {
			event.returnValue = false;
		}
	},

	stopPropagation: function()
	{
		if (event.stopPropagation) {
			event.stopPropagation();
		}
		else {
			event.cancelBubble = true;
		}
	},

	stop: function()
	{
		Jui.event.preventDefault();
		Jui.event.stopPropagation();
	},

	attach: function(element, eventName, callback)
	{
		if (element.addEventListener) {
		   element.addEventListener(eventName, callback, false);
		}
		else if (element.attachEvent) {
		   element.attachEvent("on" + eventName, callback);
		}
	},

	detach: function(element, eventName, callback)
	{
		if (element.removeEventListener) {
		   element.removeEventListener(eventName, callback, false);
		}
		else if (element.detachEvent) {
		   element.detachEvent("on" + eventName, callback);
		}
	}
};

//------------------------------------------------------------------------
// DOM
//------------------------------------------------------------------------

Jui.dom =
{
	element: function(elementId)
	{
		if (typeof(elementId) == "object" && elementId != null) {
			return elementId;
		}
		else if (typeof(elementId) == "string") {
			return document.getElementById(elementId);
		}
	},
	
	insertHtml: function(element, where, html)
	{
		where = where.toLowerCase();
		if (element.insertAdjacentHTML) {
			switch (where) {
				case "beforebegin":
					element.insertAdjacentHTML("BeforeBegin", html);
					return element.previousSibling;
				case "afterbegin":
					element.insertAdjacentHTML("AfterBegin", html);
					return element.firstChild;
				case "beforeend":
					element.insertAdjacentHTML("BeforeEnd", html);
					return element.lastChild;
				case "afterend":
					element.insertAdjacentHTML("AfterEnd", html);
					return element.nextSibling;
			}
		}
		else {
			var range = element.ownerDocument.createRange();
			switch (where) {
				case "beforebegin":
					range.setStartBefore(element);
					element.parentNode.insertBefore(range.createContextualFragment(html), element);
					return element.previousSibling;
				case "afterbegin":
					if (element.firstChild) {
						range.setStartBefore(element.firstChild);
						element.insertBefore(range.createContextualFragment(html), element.firstChild);
					}
					else {
						element.innerHTML = html;
					}
					return element.firstChild;
				case "beforeend":
					if (element.lastChild) {
						range.setStartAfter(element.lastChild);
						element.appendChild(range.createContextualFragment(html));
					}
					else {
						element.innerHTML = html;
					}
					return element.lastChild;
				case "afterend":
					range.setStartAfter(element);
					element.parentNode.insertBefore(range.createContextualFragment(html), element.nextSibling);
					return element.nextSibling;
			}
		}
	},
	
	insertElement: function(element, where, newElement)
	{
		where = where.toLowerCase();
		if (element.insertAdjacentElement) {
			switch (where) {
				case "beforebegin":
					element.insertAdjacentElement("BeforeBegin", newElement);
					break;
				case "afterbegin":
					element.insertAdjacentElement("AfterBegin", newElement);
					break;
				case "beforeend":
					element.insertAdjacentElement("BeforeEnd", newElement);
					break;
				case "afterend":
					element.insertAdjacentElement("AfterEnd", newElement);
					break;
			}
		}
		else {
			switch (where) {
				case "beforebegin":
					element.parentNode.insertBefore(newElement, element);
		            break;
				case "afterbegin":
					element.insertBefore(newElement, element.firstChild);
		            break;
				case "beforeend":
					element.appendChild(newElement);
		            break;
				case "afterend":
					element.parentNode.insertBefore(newElement, element.nextSibling);
		            break;
			}
		}
	},
	
	removeElement: function(element)
	{
		return element.parentNode.removeChild(element);
	},
	
	getAncestor: function(mark, element)
	{
		var e = element || event.srcElement;
		while (e != null && e.getAttribute("_mark") != mark) {
			e = e.parentElement || e.parentNode;
		}
		return e;
	},
	
	getAncestorByTagName: function(tagName, element)
	{
		var e = element || event.srcElement;
		tagName = tagName.toUpperCase();
		while (e != null && e.tagName != tagName) {
			e = e.parentElement || e.parentNode;
		}
		return e;
	},
	
	getAncestorByClassName: function(className, element)
	{
		var e = element || event.srcElement;
		var r = new RegExp("( |^)" + className + "( |$)");
		while (e != null && !r.test(e.className)) {
			e = e.parentElement || e.parentNode;
		}
		return e;
	},
	
	getElementsByClassName: function(parent, className)
	{
		if (parent.getElementsByClassName) {
			return parent.getElementsByClassName(className);
		}
		var elements = [];
		var reg = new RegExp("(^|\s)" + className.replace(/-/g, "\-") + "(\s|$)");        
		for (var i = 0, items = parent.all; i < items.length; ++i) {
			if (reg.test(items[i].className)) {
				elements.push(items[i]);
			}
		}
		return elements;
	},

	setAttributes: function(element, attributes)
	{
		if (attributes != null) {
			for (var key in attributes) {
				element.setAttribute(key, attributes[key]);
			}
		}
	},
	
	tagAttribute: function(element, key, set)
	{
		if (set) {
			element.setAttribute(key, true);
		}
		else {
			element.removeAttribute(key);
		}
	},

	removeAttributes: function(element, attributes)
	{
		for (var i = 0; i < attributes.length; ++i) {
			element.removeAttribute(attributes[i]);
		}
	},

	addClass: function(element, className)
	{
		var name = element.className;
		for (var i = 0, classNames = Jui.array.make(className); i < classNames.length; ++i) {
			var item = classNames[i];
			if (!new RegExp("\\b" + item + "\\b").test(name)) {
				name = Jui.string.trim(name + " " + item);
			}
		}
		if (name != element.className) {
			element.className = name;
		}
	},
	
	removeClass: function(element, className)
	{
		var name = element.className;
		for (var i = 0, classNames = Jui.array.make(className); i < classNames.length; ++i) {
			var item = classNames[i];
			var reg = new RegExp("\\b" + item + "\\b", "g");
			if (reg.test(name)) {
				name = Jui.string.trim(name.replace(reg, " "));
			}
		}
		if (name != element.className) {
			element.className = name;
		}
	},
	
	tagClass: function(element, className, isAdd)
	{
		if (isAdd) {
			Jui.dom.addClass(element, className);
		}
		else {
			Jui.dom.removeClass(element, className);
		}
	},

	setStyle: function(element, cssText)
	{
		for (var i = 0, pairs = cssText.split(";"); i < pairs.length; ++i) {
			var pair = pairs[i].split(":");
			if (pair.length == 2) {
				element.style[Jui.string.trim(pair[0])] = Jui.string.trim(pair[1]);
			}
		}
	},
	
	getComputedStyle: function(element)
	{
		return window.getComputedStyle == null ? element.currentStyle : window.getComputedStyle(element);
	},
	
	getRelativePoint: function(element, x, y)
	{
		var rect = element.getBoundingClientRect();
		return {x:x - rect.left, y:y - rect.top};
	},
	
	setInnerText: function(element, text)
	{
		if (Jui.browser.mozilla) {
			while (element.firstChild != null) {
				element.removeChild(element.firstChild);
			}
			element.appendChild(document.createTextNode(text));
		}
		else {
			element.innerText = text;
		}
    },
	
    getFrameWindow: function(frame)
    {
    	return frame.contentWindow || frame.window;
    }
};

//------------------------------------------------------------------------
// browser
//------------------------------------------------------------------------

Jui.browser =
{
	isTouchDevice: function()
	{
		return ("ontouchstart" in window) || window.DocumentTouch && document instanceof DocumentTouch;
	},

	parseUserAgent: function(userAgent)
	{
		var webkit				= /(webkit)[ \/]([\w.]+)/;
		var trident				= /(trident)\/([\w.]+)/;
		var mozilla				= /(mozilla)(?:.*? rv:([\w.]+))?/;
		var ua					= userAgent.toLowerCase();
		var match				= webkit.exec(ua) || trident.exec(ua)
								|| ua.indexOf("compatible") < 0 && mozilla.exec(ua)
								|| [];
		var browser				= {};
		browser.type			= match[1] || "";
		browser.version			= match[2] || "0";
		browser.majorVersion	= parseInt(match[2]) || 0;
		browser.supportCanvas	= browser.type != "trident" || browser.majorVersion > 4;
		browser[browser.type]	= true;
		return browser;
	},
	
	getCookie: function(name)
	{
		var cookies = document.cookie.split("; ");
		for (var i = 0; i < cookies.length; ++i) {
			var pair = cookies[i].split("=");
			if (pair[0] == name) {
				return unescape(pair[1]);
			}
		}
	},
	
	setCookie: function(name, value)
	{
		var date = new Date();
		date.setFullYear(date.getFullYear() + 1);
		document.cookie = name + "=" + escape(value) + "; expires=" + date.toGMTString();
	},
	
	deleteCookie: function(name)
	{
		var date = new Date(0);
		document.cookie = name + "=; expires=" + date.toGMTString();
	},
	
	getScrollBarWidth: function()
	{
		if (Jui.browser._scrollBarWidth == null) {
			var html = "<div style='position:fixed;top:0px;left:0px;width:80px;height:80px;overflow:scroll'></div>";
			var elem = Jui.dom.insertHtml(document.body, "BeforeEnd", html);
			var width = elem.offsetWidth - elem.clientWidth;
			if (width > 0) {
				Jui.browser._scrollBarWidth = width;
			}
			document.body.removeChild(elem);
		}
		return Jui.browser._scrollBarWidth == null ? 16 : Jui.browser._scrollBarWidth;
	}
};

//------------------------------------------------------------------------
// dialog and frame
//------------------------------------------------------------------------

Jui.window =
{
	isTop: function()
	{
		return window == Jui.window.getTop();
	},

	getTop: function()
	{
		var topWindow = window;
		for (var w = window; w != w.parent;) {
			w = w.parent;
			try {
				if (w.Jui != null) {
					topWindow = w;
				}
			}
			catch (e) {
				break;
			}
		}
		return topWindow;
	},
	
	getCoord: function()
	{
		var coord = {x:0, y:0};
		var topWindow = Jui.window.getTop();
		for (var w = window; w != topWindow; w = w.parent) {
			var rect = w.frameElement.getBoundingClientRect();
			coord.x += rect.left;
			coord.y += rect.top;
		}
		return coord;
	},
	
	toTopCoord: function(point)
	{
		var topWindow = Jui.window.getTop();
		for (var w = window; w != topWindow; w = w.parent) {
			var rect = w.frameElement.getBoundingClientRect();
			point.x += rect.left;
			point.y += rect.top;
		}
		return point;
	}
};

//------------------------------------------------------------------------
// message
//------------------------------------------------------------------------

Jui.message =
{
	alert: function(message, callback)
	{
		return Jui.basic.MessageBox.open({icon:"warning", text:message, callback:callback});
	},
	
	info: function(message, callback)
	{
		return Jui.basic.MessageBox.open({icon:"info", text:message, callback:callback});
	},
	
	error: function(message, callback)
	{
		return Jui.basic.MessageBox.open({icon:"error", text:message, callback:callback});
	},
	
	confirm: function(message, callback, handleCancelEvent)
	{
		var mbox = Jui.basic.MessageBox;
		return mbox.open({icon:"question", text:message, buttons:mbox.OKCANCEL, callback:function(result) {
			if (callback != null && (handleCancelEvent || result != "cancel")) {
				callback(result);
			}
		}});
	},
	
	ync: function(message, callback, handleCancelEvent)
	{
		var mbox = Jui.basic.MessageBox;
		return mbox.open({icon:"question", text:message, buttons:mbox.YESNOCANCEL, callback:function(result) {
			if (callback != null && (handleCancelEvent || result != "cancel")) {
				callback(result);
			}
		}});
	},
	
	hint: function(message, icon, callback)
	{
		return Jui.basic.MessageBox.open({type:"hint", icon:icon, text:message, callback:callback});
	},
	
	htmlHint: function(message, icon, callback)
	{
		return Jui.basic.MessageBox.open({type:"hint", icon:icon, html:message, callback:callback});
	},
	
	success: function(message, callback)
	{
		return Jui.basic.MessageBox.open({type:"hint", icon:"success", duration:1, text:message, callback:callback});
	},
	
	progress: function(callback)
	{
		return Jui.basic.ProgressBar.open({callback:callback});
	}
};

//------------------------------------------------------------------------
// popup
//------------------------------------------------------------------------

Jui.popup =
{
	_serial: 0,
	
	_map: {},
	
	_currentOwner: null,
	
	_currentPopups: [],
	
	$create: function(html, owner)
	{
		return Jui.window.getTop().Jui.popup._create(html, owner, document);
	},
	
	_create: function(html, owner, doc)
	{
		var popup = Jui.dom.insertHtml(document.body, "BeforeEnd", html);
		popup._owner = owner;
		popup._document = doc;
		Jui.popup._map[++Jui.popup._serial] = popup;
		return popup;
	},
	
	$show: function(popup, aligns, width, height, scrollable)
	{
		var topWindow = Jui.window.getTop();
		if (!aligns.isTop && topWindow != window) {
			var coord 		= Jui.window.getCoord();
			aligns.left 	= aligns.left == null ? null : aligns.left + coord.x;
			aligns.right 	= aligns.right == null ? null : aligns.right + coord.x;
			aligns.top 		= aligns.top == null ? null : aligns.top + coord.y;
			aligns.bottom	= aligns.bottom == null ? null : aligns.bottom + coord.y;
		}
		return topWindow.Jui.popup._show(popup, aligns, width, height, scrollable);
	},
	
	_show: function(popup, aligns, width, height, scrollable)
	{
		if (popup._owner != Jui.popup._currentOwner) {
			Jui.popup._hideCurrent();
			Jui.popup._currentOwner = popup._owner;
		}
		for (var i = Jui.popup._currentPopups.length - 1; i >= 0; --i) {
			if (Jui.popup._currentPopups[i] == popup) {
				Jui.popup._currentPopups.splice(i, 1);
			}
		}
		
		var margin		= Jui.theme["Popup.Margin"];
		var scrollLeft	= document.documentElement.scrollLeft;// + document.body.scrollLeft;
		var scrollTop	= document.documentElement.scrollTop;// + document.body.scrollTop;
		var spaceLeft	= aligns.right + 1;
		var spaceRight	= document.documentElement.clientWidth - aligns.left;
		var spaceTop	= aligns.bottom + 1;
		var spaceBottom	= document.documentElement.clientHeight - aligns.top;
		if (scrollable && spaceTop < height && spaceBottom < height) {
			height = Math.max(spaceTop - margin, spaceBottom - margin, 2);
		}

		var isLeft			= spaceRight < width && spaceLeft >= width;
		var isTop			= spaceBottom < height && spaceTop >= height;
		popup.style.left	= scrollLeft + (isLeft ? aligns.right - width + 1 : aligns.left) + "px";
		popup.style.top		= scrollTop + (isTop ? aligns.bottom - height + 1 : aligns.top) + "px";
		popup.style.width	= width + "px";
		popup.style.height	= height + "px";
		popup.style.display	= "block";
		popup.scrollTop 	= 0;
		Jui.popup._currentPopups.push(popup);
		return {isLeft:isLeft, isTop:isTop};
	},
	
	$isOpen: function(popup)
	{
		return popup != null && popup.style.display == "block";
	},
	
	$hide: function(popup)
	{
		Jui.window.getTop().Jui.popup._hide(popup);
	},
	
	_hide: function(popup)
	{
		popup.style.display = "none";
		var popups = Jui.popup._currentPopups;
		for (var i = popups.length - 1; i >= 0; --i) {
			if (popups[i] == popup) {
				popups.splice(i, 1);
			}
		}
		if (popups.length == 0) {
			Jui.popup._currentOwner = null;
		}
	},
	
	_hideCurrent: function()
	{
		if (window != Jui.window.getTop()) {
			Jui.window.getTop().Jui.popup._hideCurrent();
		}
		if (Jui.popup._currentOwner != null) {
			try {
				if (Jui.popup._currentOwner.$hidePopup != null) {
					Jui.popup._currentOwner.$hidePopup();
					Jui.popup._currentPopups = [];
					Jui.popup._currentOwner = null;
					return;
				}
			}
			catch (e) {
			}
			for (var i = 0, popups = Jui.popup._currentPopups; i < popups.length; ++i) {
				popups[i].style.display = "none";
			}
			Jui.popup._currentPopups = [];
			try {
				if (Jui.popup._currentOwner.$doPopupHide != null) {
					Jui.popup._currentOwner.$doPopupHide();
				}
			}
			catch (e) {
			}
			Jui.popup._currentOwner = null;
		}
	},
	
	doWindowLoad: function()
	{
		Jui.popup._windowInnerWidth = window.innerWidth;
		Jui.popup._windowInnerHeight = window.innerHeight;
	},
	
	doWindowResize: function()
	{
		if (window.innerWidth != Jui.popup._windowInnerWidth || window.innerHeight != Jui.popup._windowInnerHeight) {
			Jui.popup._windowInnerWidth = window.innerWidth;
			Jui.popup._windowInnerHeight = window.innerHeight;
			Jui.popup._hideCurrent();
		}
	},
	
	doDocumentMouseDown: function()
	{
		Jui.popup._hideCurrent();
	},
	
	$free: function(popup)
	{
		popup._document = null;
		Jui.dom.removeElement(popup);
	},

	_garbageCollect: function()
	{
		var n = 0;
		for (var serial in Jui.popup._map) {
			try {
				var popup = Jui.popup._map[serial];
				if (popup._document == null || !popup._document._ready) {
					delete Jui.popup._map[serial];
					continue;
				}
				var owner = popup._owner;
				while (owner.element == null && owner.getOwner != null && owner.getOwner() != null) {
					owner = owner.getOwner();
				}
				var elem = owner.element;
				while (elem != null && elem.parentElement != null) {
					elem = elem.parentElement;
				}
				if (elem != null && elem.tagName != "HTML") {
					delete Jui.popup._map[serial];
					continue;
				}
				++n;
			}
			catch (e) {
				delete Jui.popup._map[serial];
			}
		}
		if (n > 1000) {
			console.warn("too many(" + n + ") popups.");
		}
	}
};

//------------------------------------------------------------------------
// upload
//------------------------------------------------------------------------

Jui.upload =
{
	_mask: null,
	
	_input: null,
	
	selectFile: function(options, callback)
	{
		options = options || {};
		if (Jui.upload._input == null) {
			var html = "<input type=file style='display:none'>";
			Jui.upload._input = Jui.dom.insertHtml(document.body, "BeforeEnd", html);
		}
		Jui.upload._input.multiple	= Jui.cast.toBool(options.multiple, false);
		Jui.upload._input.accept 	= options.accept;
		Jui.upload._input.value 	= null;
		Jui.upload._input.onchange	= function() {
			if (Jui.upload._checkFiles(this.files, options)) {
				callback(this.files, options);
			}
		};
		Jui.upload._input.click();
	},
	
	setFileDropZone: function(element, options, callback)
	{
		options = options || {};
		var elem = Jui.dom.element(element);
		elem._fileUploadInfo = {options:options, callback:callback};
		Jui.event.attach(elem, "dragenter", Jui.upload._doFileDragEnter);
	},
	
	_doFileDragEnter: function()
	{
		Jui.event.stop();
		if (Jui.array.contains(event.dataTransfer.types, "Files")) {
			if (Jui.upload._mask == null) {
				var html						= "<div class=JuiFileDropZoneMask></div>";
				Jui.upload._mask				= Jui.dom.insertHtml(document.body, "BeforeEnd", html); 
				Jui.upload._mask.ondragleave	= Jui.upload._doFileDragLeave;
				Jui.upload._mask.ondragover		= Jui.upload._doFileDragOver;
				Jui.upload._mask.ondrop			= Jui.upload._doFileDrop;
			}
			Jui.upload._fileDropZone		= this;
			Jui.upload._fileUploadInfo 		= this._fileUploadInfo;
			var rect 						= this.getBoundingClientRect();
			Jui.upload._mask.style.left 	= rect.left + "px"; 
			Jui.upload._mask.style.top 		= rect.top + "px"; 
			Jui.upload._mask.style.width 	= rect.width + "px"; 
			Jui.upload._mask.style.height	= rect.height + "px"; 
			Jui.upload._mask.style.display	= "block";
		}
	},

	_doFileDragLeave: function(event)
	{
		Jui.event.stop();
		this.style.display = "none";
    },

    _doFileDragOver: function()
    {
		Jui.event.stop();
		event.dataTransfer.dropEffect = "copy";
    },

    _doFileDrop: function(event)
    {
		Jui.event.stop();
		this.style.display = "none";
		var info = Jui.upload._fileUploadInfo;
		var files = event.dataTransfer.files;
		if (Jui.upload._checkFiles(files, info.options)) {
			info.callback.call(Jui.upload._fileDropZone, files, info.options);
		}
    },
    
    _checkFiles: function(files, options)
    {
    	if (!options.multiple && files.length != 1) {
    		Jui.message.alert(Jui.i18n.getText("Jui.Upload.FileCountInvalid"));
    		return false;
    	}
    	var file = files[0];
    	if (options.typePattern != null && !options.typePattern.test(file.type)
    		|| options.namePattern != null && !options.namePattern.test(file.name)) {
    		var message = Jui.i18n.getText("Jui.Upload.FileTypeInvalid");
    		Jui.message.alert(message.replace("${0}", file.name));
    		return false;
    	}
    	if (file.size > options.maxSize) {
    		var message = Jui.i18n.getText("Jui.Upload.FileSizeInvalid");
    		var maxSizeText = Jui.cast.toFileSizeText(options.maxSize, true);
    		Jui.message.alert(message.replace("${0}", file.name).replace("${1}", maxSizeText));
    		return false;
    	}
    	return true;
    }
};

//------------------------------------------------------------------------
// i18n
//------------------------------------------------------------------------

Jui.i18n = 
{
	_locale: null,

	_textGetter: null,

	getText: function(key)
	{
		var func = Jui.i18n._textGetter;
		return (func == null ? Jui.i18n.map[key] : func(key)) || key;
	},

	getLocale: function()
	{
		if (Jui.i18n._locale == null) {
			var locale = Jui.browser.getCookie("Jui.Locale");
			if (Jui.string.isEmpty(locale)) {
				locale = (navigator.language || navigator.browserLanguage || "en-us").toLowerCase();
			}
			Jui.i18n._locale = locale;
		}
		return Jui.i18n._locale;
	},
	
	setTextGetter: function(getter)
	{
		Jui.i18n._textGetter = getter;
	},
	
	_getFileName: function()
	{
		var locale = Jui.i18n.getLocale();
		var supportedLocales = ["en-us", "zh-cn", "zh-tw"];
		return Jui.array.contains(supportedLocales, locale) ? locale + ".js" : "en-us.js";
	}
};

//------------------------------------------------------------------------
// MD5
//------------------------------------------------------------------------

Jui.md5 =
{
	_hex_digits: '0123456789abcdef'.split(''),

	asString: function(s)
	{
		var ints = Jui.md5.asIntegers(s);
		var digits = [];
		for (var i = 0; i < ints.length; i++) {
			var value = ints[i];
			for (var j = 0; j < 4; j++) {
				digits.push(Jui.md5._hex_digits[(value >> (j * 8 + 4)) & 0x0F]);
				digits.push(Jui.md5._hex_digits[(value >> (j * 8)) & 0x0F]);
			}
		}
		return digits.join('');
	},

	asUint8Array: function(s)
	{
		var ints = Jui.md5.asIntegers(s);
		var uint8 = new Uint8Array(16);
		for (var i = 0; i < ints.length; ++i) {
			var value = ints[i];
			for (var j = 0; j < 4; ++j) {
				uint8[i * 4 + j] = (value >> (j * 8)) & 0xFF;
			}
		}
		return uint8;
	},
	
	asIntegers: function(s)
	{
		var bytes;
		if (typeof s === "string") {
			bytes = Jui.md5._toUtf8Bytes(s);
		}
		else if (Array.isArray(s)) {
			bytes = s;
		}
		else {
			throw new Error("Jui.md5 argument should be either string or byte array");
		}
		return Jui.md5._hash(bytes);
	},

	_hash: function(bytes)
	{
		var n = bytes.length;
		var state = [1732584193, -271733879, -1732584194, 271733878];
		var i;
		for (i = 64; i <= bytes.length; i += 64) {
			Jui.md5._hashCycle(state, Jui.md5._hashBlk(bytes.slice(i - 64, i)));
		}
		bytes = bytes.slice(i - 64);
		var tail = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		for (i = 0; i < bytes.length; i++) {
			tail[i >> 2] |= bytes[i] << ((i % 4) << 3);
		}
		tail[i >> 2] |= 0x80 << ((i % 4) << 3);
		if (i > 55) {
			Jui.md5._hashCycle(state, tail);
			for (i = 0; i < 16; i++)
				tail[i] = 0;
		}
		tail[14] = n * 8;
		Jui.md5._hashCycle(state, tail);
		return state;
	},

	_hashBlk: function(bytes)
	{
		var blks = [];
		var i;
		for (i = 0; i < 64; i += 4) {
			blks[i >> 2] = bytes[i]
				 + (bytes[i + 1] << 8)
				 + (bytes[i + 2] << 16)
				 + (bytes[i + 3] << 24);
		}
		return blks;
	},
	
	_hashCycle: function(x, k)
	{
		var a = x[0];
		var b = x[1];
		var c = x[2];
		var d = x[3];

		a = Jui.md5._ff(a, b, c, d, k[0], 7, -680876936);
		d = Jui.md5._ff(d, a, b, c, k[1], 12, -389564586);
		c = Jui.md5._ff(c, d, a, b, k[2], 17, 606105819);
		b = Jui.md5._ff(b, c, d, a, k[3], 22, -1044525330);
		a = Jui.md5._ff(a, b, c, d, k[4], 7, -176418897);
		d = Jui.md5._ff(d, a, b, c, k[5], 12, 1200080426);
		c = Jui.md5._ff(c, d, a, b, k[6], 17, -1473231341);
		b = Jui.md5._ff(b, c, d, a, k[7], 22, -45705983);
		a = Jui.md5._ff(a, b, c, d, k[8], 7, 1770035416);
		d = Jui.md5._ff(d, a, b, c, k[9], 12, -1958414417);
		c = Jui.md5._ff(c, d, a, b, k[10], 17, -42063);
		b = Jui.md5._ff(b, c, d, a, k[11], 22, -1990404162);
		a = Jui.md5._ff(a, b, c, d, k[12], 7, 1804603682);
		d = Jui.md5._ff(d, a, b, c, k[13], 12, -40341101);
		c = Jui.md5._ff(c, d, a, b, k[14], 17, -1502002290);
		b = Jui.md5._ff(b, c, d, a, k[15], 22, 1236535329);

		a = Jui.md5._gg(a, b, c, d, k[1], 5, -165796510);
		d = Jui.md5._gg(d, a, b, c, k[6], 9, -1069501632);
		c = Jui.md5._gg(c, d, a, b, k[11], 14, 643717713);
		b = Jui.md5._gg(b, c, d, a, k[0], 20, -373897302);
		a = Jui.md5._gg(a, b, c, d, k[5], 5, -701558691);
		d = Jui.md5._gg(d, a, b, c, k[10], 9, 38016083);
		c = Jui.md5._gg(c, d, a, b, k[15], 14, -660478335);
		b = Jui.md5._gg(b, c, d, a, k[4], 20, -405537848);
		a = Jui.md5._gg(a, b, c, d, k[9], 5, 568446438);
		d = Jui.md5._gg(d, a, b, c, k[14], 9, -1019803690);
		c = Jui.md5._gg(c, d, a, b, k[3], 14, -187363961);
		b = Jui.md5._gg(b, c, d, a, k[8], 20, 1163531501);
		a = Jui.md5._gg(a, b, c, d, k[13], 5, -1444681467);
		d = Jui.md5._gg(d, a, b, c, k[2], 9, -51403784);
		c = Jui.md5._gg(c, d, a, b, k[7], 14, 1735328473);
		b = Jui.md5._gg(b, c, d, a, k[12], 20, -1926607734);

		a = Jui.md5._hh(a, b, c, d, k[5], 4, -378558);
		d = Jui.md5._hh(d, a, b, c, k[8], 11, -2022574463);
		c = Jui.md5._hh(c, d, a, b, k[11], 16, 1839030562);
		b = Jui.md5._hh(b, c, d, a, k[14], 23, -35309556);
		a = Jui.md5._hh(a, b, c, d, k[1], 4, -1530992060);
		d = Jui.md5._hh(d, a, b, c, k[4], 11, 1272893353);
		c = Jui.md5._hh(c, d, a, b, k[7], 16, -155497632);
		b = Jui.md5._hh(b, c, d, a, k[10], 23, -1094730640);
		a = Jui.md5._hh(a, b, c, d, k[13], 4, 681279174);
		d = Jui.md5._hh(d, a, b, c, k[0], 11, -358537222);
		c = Jui.md5._hh(c, d, a, b, k[3], 16, -722521979);
		b = Jui.md5._hh(b, c, d, a, k[6], 23, 76029189);
		a = Jui.md5._hh(a, b, c, d, k[9], 4, -640364487);
		d = Jui.md5._hh(d, a, b, c, k[12], 11, -421815835);
		c = Jui.md5._hh(c, d, a, b, k[15], 16, 530742520);
		b = Jui.md5._hh(b, c, d, a, k[2], 23, -995338651);

		a = Jui.md5._ii(a, b, c, d, k[0], 6, -198630844);
		d = Jui.md5._ii(d, a, b, c, k[7], 10, 1126891415);
		c = Jui.md5._ii(c, d, a, b, k[14], 15, -1416354905);
		b = Jui.md5._ii(b, c, d, a, k[5], 21, -57434055);
		a = Jui.md5._ii(a, b, c, d, k[12], 6, 1700485571);
		d = Jui.md5._ii(d, a, b, c, k[3], 10, -1894986606);
		c = Jui.md5._ii(c, d, a, b, k[10], 15, -1051523);
		b = Jui.md5._ii(b, c, d, a, k[1], 21, -2054922799);
		a = Jui.md5._ii(a, b, c, d, k[8], 6, 1873313359);
		d = Jui.md5._ii(d, a, b, c, k[15], 10, -30611744);
		c = Jui.md5._ii(c, d, a, b, k[6], 15, -1560198380);
		b = Jui.md5._ii(b, c, d, a, k[13], 21, 1309151649);
		a = Jui.md5._ii(a, b, c, d, k[4], 6, -145523070);
		d = Jui.md5._ii(d, a, b, c, k[11], 10, -1120210379);
		c = Jui.md5._ii(c, d, a, b, k[2], 15, 718787259);
		b = Jui.md5._ii(b, c, d, a, k[9], 21, -343485551);

		x[0] = Jui.md5._add32(a, x[0]);
		x[1] = Jui.md5._add32(b, x[1]);
		x[2] = Jui.md5._add32(c, x[2]);
		x[3] = Jui.md5._add32(d, x[3]);
	},

	_cmn: function(q, a, b, x, s, t)
	{
		a = Jui.md5._add32(Jui.md5._add32(a, q), Jui.md5._add32(x, t));
		return Jui.md5._add32((a << s) | (a >>> (32 - s)), b);
	},

	_add32: function(a, b)
	{
		return (a + b) & 0xFFFFFFFF;
	},

	_ff: function(a, b, c, d, x, s, t)
	{
		return Jui.md5._cmn((b & c) | ((~b) & d), a, b, x, s, t);
	},

	_gg: function(a, b, c, d, x, s, t)
	{
		return Jui.md5._cmn((b & d) | (c & (~d)), a, b, x, s, t);
	},

	_hh: function(a, b, c, d, x, s, t)
	{
		return Jui.md5._cmn(b ^ c ^ d, a, b, x, s, t);
	},

	_ii: function(a, b, c, d, x, s, t)
	{
		return Jui.md5._cmn(c ^ (b | (~d)), a, b, x, s, t);
	},

	_toUtf8Bytes: function(str)
	{
		var utf8 = [];
		for (var i=0; i < str.length; i++) {
			var charcode = str.charCodeAt(i);
			if (charcode < 0x80) utf8.push(charcode);
			else if (charcode < 0x800) {
				utf8.push(0xc0 | (charcode >> 6), 
						  0x80 | (charcode & 0x3f));
			}
			else if (charcode < 0xd800 || charcode >= 0xe000) {
				utf8.push(0xe0 | (charcode >> 12), 
						  0x80 | ((charcode>>6) & 0x3f), 
						  0x80 | (charcode & 0x3f));
			}
			// surrogate pair
			else {
				i++;
				// UTF-16 encodes 0x10000-0x10FFFF by
				// subtracting 0x10000 and splitting the
				// 20 bits of 0x0-0xFFFFF into two halves
				charcode = 0x10000 + (((charcode & 0x3ff)<<10)
						  | (str.charCodeAt(i) & 0x3ff));
				utf8.push(0xf0 | (charcode >>18), 
						  0x80 | ((charcode>>12) & 0x3f), 
						  0x80 | ((charcode>>6) & 0x3f), 
						  0x80 | (charcode & 0x3f));
			}
		}
		return utf8;
	}
};

//------------------------------------------------------------------------
// script
//------------------------------------------------------------------------

Jui.script = 
{
	_path: null,
	
	getPath: function()
	{
		if (Jui.script._path == null) {
			var scripts = document.getElementsByTagName("script");
			var script = scripts[scripts.length - 1];
			Jui.script._path = script.src.replace(/\/[^\/]*$/, "");
		}
		return Jui.script._path;
	}
};

//------------------------------------------------------------------------
// theme
//------------------------------------------------------------------------

Jui.theme = 
{
	_name: Jui.browser.getCookie("Jui.Theme") || "iphone",
	
	getName: function()
	{
		return Jui.theme._name;
	},
	
	setName: function(name)
	{
		//TODO add other themes
		if (name != "iphone") {
			name = "iphone";
		}
		Jui.theme._name = name;
		Jui.browser.setCookie("Jui.Theme", name); 
	},
	
	getPath: function(relativePath)
	{
		var path = Jui.script.getPath() + "/../theme/" + Jui.theme.getName();
		if (!Jui.string.isEmpty(relativePath)) {
			path = path + "/" + relativePath;
		}
		return path;
	}
};

//------------------------------------------------------------------------
// scroll
//------------------------------------------------------------------------

Jui.scroll =
{
	doDocumentTouchStart: function()
	{
		var elem = event.target;
		while (elem != null && elem != document.documentElement) {
			if (elem.getAttribute("JuiScrollable") == "true") {
				if (elem._scroll == null) {
					elem._scroll = {
						touchCount		: 0,
						scrollable		: false,
						startScrollTop	: 0,
						startPageY		: 0,
						points			: [],
						timer			: null,
						barTimer		: null
					};
					Jui.dom.insertHtml(elem, "BeforeEnd", "<div class=JuiScrollBar></div>");
				}
				var info = elem._scroll;
				Jui.scroll._clearTimer(elem);
				if (event.touches.length != 1 && info.scrollable) {
					info.scrollable = false;
					Jui.scroll._finish(elem);
				}
				else if (event.touches.length == 1 && info.touchCount == 0) {
					var touch = event.touches[0];
					info.scrollable = true;
					info.startScrollTop = elem.firstChild.scrollTop;
					info.startPageY = touch.pageY;
					info.points = [];
					Jui.scroll._addToPath(info.points, touch);
					if (elem.firstChild.offsetTop != 0) {
						elem.firstChild.style.top = "0px";
					}
				}
				else {
					info.scrollable = false;
				}
				info.touchCount = event.touches.length;
			}
			elem = elem.parentNode;
		}
	},

	doDocumentTouchMove: function()
	{
		var elem = event.target;
		while (elem != null && elem != document.documentElement) {
			if (elem.getAttribute("JuiScrollable") == "true") {
				var info = elem._scroll;
				if (info && info.scrollable) {
					var touch = event.touches[0];
					var inner = elem.firstChild;
					var sh = inner.scrollHeight;
					var ch = inner.clientHeight;
					var maxScrollTop = sh - ch;
					var scrollTop = info.startScrollTop + info.startPageY - touch.pageY; 
					inner.scrollTop = Math.max(0, Math.min(maxScrollTop, scrollTop));
					if (scrollTop < 0) {
						inner.style.top = -scrollTop * 0.5 + "px";
					}
					else if (scrollTop + inner.offsetHeight > inner.scrollHeight) {
						inner.style.top = -(scrollTop - maxScrollTop) * 0.5 + "px";
					}
					else {
						inner.style.top = "0px";
					}
					Jui.scroll._addToPath(info.points, touch);
					Jui.scroll._updateScrollBar(elem);
				}
				break;
			}
			elem = elem.parentNode;
		}
	    event.preventDefault();
	},
	
	doDocumentTouchEnd: function()
	{
		var elem = event.target;
		while (elem != null && elem != document.documentElement) {
			if (elem.getAttribute("JuiScrollable") == "true") {
				var info = elem._scroll;
				info.touchCount = event.touches.length;
				if (info.scrollable) {
					info.scrollable = false;
					Jui.scroll._addToPath(info.points, event.changedTouches[0]);
					Jui.scroll._finish(elem);
				}
			}
			elem = elem.parentNode;
		}
	},
	
	_addToPath: function(points, touch)
	{
		points.push({y:touch.pageY, time:new Date().getTime()});
		if (points.length > 5) {
			points.shift();
		}
	},
	
	$getSpeed: function(points)
	{
		var speed = 0;
		if (points.length > 2) {
			var end = points[points.length - 1];
			var distance = 0;
			var time = 0;
			for (var i = points.length - 2; i >= 0; --i) {
				var point = points[i];
				if (point.time < end.time - 300) {
					break;
				}
				if (Math.abs(end.y - point.y) < Math.abs(distance)) {
					break;
				}
				distance = end.y - point.y;
				time = end.time - point.time;
			}
			if (time > 0) {
				speed = distance / time;
			}
		}
		return speed;
	},
	
	_finish: function(elem)
	{
		var inner = elem.firstChild;
		if (inner.offsetTop != 0) {
			Jui.scroll._bounceBack(elem);
			return;
		}
		
		var speed = Jui.scroll.$getSpeed(elem._scroll.points);
		if (Math.abs(speed) < 0.1) {
			return;
		}
		
		var startScrollTop = inner.scrollTop;
		var startTime = new Date().getTime();
		elem._scroll.timer = setInterval(function() {
			var DURATION		= 2000;
			var BOUNCE_DURATION	= 200;
			var BOUNCE_DISTANCE	= inner.clientHeight * 0.3;
			var BOUNCE_RATIO	= 10;
			var elapse			= Math.min(DURATION, new Date().getTime() - startTime);
			var v				= speed * (DURATION - elapse) / DURATION;
			var d				= elapse * (speed + v) / 2;
			var scrollTop		= startScrollTop - d;
			var sh				= inner.scrollHeight;
			var ch				= inner.clientHeight;
			if (scrollTop >= 0 && scrollTop <= sh - ch) {
				inner.scrollTop = scrollTop;
				inner.style.top = "0px";
				if (elapse >= DURATION) {
					Jui.scroll._clearTimer(elem);
				}
			}
			else {
				var actualScrollTop = scrollTop < 0 ? 0 : sh - ch;
				var scrollDistance = startScrollTop - actualScrollTop;
				var expectedDistance = speed * DURATION / 2;
				var bounceSpeed = speed * Math.sqrt(1 - Math.abs(scrollDistance / expectedDistance));
				var bounceTime = Math.min(BOUNCE_DURATION, DURATION * bounceSpeed / speed / BOUNCE_RATIO);
				var bounceElapse = elapse - DURATION * (1 - bounceSpeed / speed);
				var expectedBounceDistance = bounceTime * bounceSpeed / 2;
				if (Math.abs(expectedBounceDistance) > BOUNCE_DISTANCE) {
					bounceTime *= BOUNCE_DISTANCE / Math.abs(expectedBounceDistance);
				}
				if (bounceElapse > bounceTime) {
					bounceElapse = bounceTime;
				}
				var currentSpeed = bounceSpeed * (1 - bounceElapse / bounceTime); 
				inner.scrollTop = actualScrollTop;
				inner.style.top = (bounceSpeed + currentSpeed) * bounceElapse / 2 + "px";
				if (bounceElapse >= bounceTime) {
					Jui.scroll._clearTimer(elem);
					Jui.scroll._bounceBack(elem);
				}
			}
			Jui.scroll._updateScrollBar(elem);
		}, 10);
	},
	
	_bounceBack: function(elem)
	{
		var inner = elem.firstChild;
		var startOffsetTop = inner.offsetTop;
		if (startOffsetTop == 0) {
			return;
		}
		var startTime = new Date().getTime();
		var MAX_DURATION = 360;
		var MAX_OFFSET_TOP = inner.clientHeight / 2;
		var duration = MAX_DURATION * Math.min(1, Math.abs(startOffsetTop / MAX_OFFSET_TOP));
		var speed = 2 * startOffsetTop / duration;
		elem._scroll.timer = setInterval(function() {
			var elapse = Math.min(duration, new Date().getTime() - startTime);
			inner.style.top = startOffsetTop * (1 - elapse / duration) + "px";
			Jui.scroll._updateScrollBar(elem);
			if (elapse >= duration) {
				Jui.scroll._clearTimer(elem);
			}
		}, 10);
	},
	
	_updateScrollBar: function(elem)
	{
		try {
			elem.lastChild.style.display = "block";
			var inner = elem.firstChild;
			var bar = elem.lastChild;
			var style = Jui.dom.getComputedStyle(bar);
			var margin = parseInt(style.right);
			var ch = inner.clientHeight;
			var sh = Math.max(ch, inner.scrollHeight);
			var st = inner.scrollTop;
			var MIN_HEIGHT = Math.min(20, ch / 2);
			var SHRINK_HEIGHT = parseInt(style.width);
			var SHRINK_RANGE = Math.max(10, ch / 6);
			var h = Math.max(MIN_HEIGHT, (ch - 2 * margin) * ch / sh);
			if (inner.offsetTop < 0) {
				var r = Math.min(1, -inner.offsetTop / SHRINK_RANGE); 
				bar.style.top = "auto";
				bar.style.bottom = margin + "px";
				bar.style.height = (r * SHRINK_HEIGHT + (1 - r) * h) + "px";
			}
			else if (inner.offsetTop > 0) {
				var r = Math.min(1, inner.offsetTop / SHRINK_RANGE); 
				bar.style.top = margin + "px";
				bar.style.bottom = "auto";
				bar.style.height = (r * SHRINK_HEIGHT + (1 - r) * h) + "px";
			}
			else {
				bar.style.top = margin + (sh == ch ? 0 : (ch - 2 * margin - h) * st / (sh - ch)) + "px";
				bar.style.bottom = "auto";
				bar.style.height = h + "px";
			}
			elem._lastUpdateTime = new Date().getTime();
		}
		catch (e) {
		}
	},
	
	_clearTimer: function(elem)
	{
		if (elem._scroll.timer != null) {
			clearInterval(elem._scroll.timer);
			elem._scroll.timer = null;
		}
	}
};

//------------------------------------------------------------------------
// initialization
//------------------------------------------------------------------------

(function() {
	var themePath = Jui.theme.getPath();
	var scriptPath = Jui.script.getPath();
	document.writeln("<link rel='stylesheet' type='text/css' href='" + themePath + "/Style.css'>");
	document.writeln("<script src='" + themePath + "/Style.js'></script>");
	document.writeln("<script src='" + scriptPath + "/../locale/" + Jui.i18n._getFileName() + "'></script>");

	//the code between //--REMOVE--[ and //--REMOVE--] will be automatically removed when building package
	//see com.jeedsoft.quicksilver.toolset.pack.jeedui.JuiCompressor
	//--REMOVE--[
	document.writeln("<script src='" + scriptPath + "/util/FastClick.js'></script>");
	document.writeln("<script src='" + scriptPath + "/util/Scroll.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/Control.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/PopupMenu.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/Button.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/ComboButton.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/Box.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/CheckBox.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/ComboBox.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/DateBox.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/InputBox.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/EntityBox.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/TextBox.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/Page.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/PickList.js'></script>");
	document.writeln("<script src='" + scriptPath + "/basic/DatePicker.js'></script>");
	document.writeln("<script src='" + scriptPath + "/option/TabBar.js'></script>");
	document.writeln("<script src='" + scriptPath + "/option/List.js'></script>");
	document.writeln("<script src='" + scriptPath + "/option/Form.js'></script>");
	//--REMOVE--]

	Jui.event.attach(window, "load", function() {FastClick.attach(document.body);});
	Jui.event.attach(window, "load", Jui.popup.doWindowLoad);
	Jui.event.attach(window, "resize", Jui.popup.doWindowResize);
	Jui.event.attach(document, "mousedown", Jui.popup.doDocumentMouseDown);
	document._ready = true;
	Jui.event.attach(window, "unload", function() {
		document._ready = false;
	});

	if (Jui.window.isTop()) {
		setInterval(Jui.popup._garbageCollect, 3000);
	}
	
	Jui.object.merge(Jui.browser, Jui.browser.parseUserAgent(navigator.userAgent));
	if (Jui.browser.mozilla) {
		Object.defineProperty(window.constructor.prototype, "event", {get:function() {
			for (var f = arguments.callee.caller; f != null; f = f.caller) {
				if (f.arguments[0] instanceof Event) {
					return f.arguments[0];
				}
			}
		}});
		Object.defineProperty(Event.prototype, "srcElement", {get:function() {
			return this.target;
		}}); 
		Object.defineProperty(MouseEvent.prototype, "fromElement",  {get:function() {  
			var node = this.type == "mouseover" ? this.relatedTarget : (this.type == "mouseout" ? this.target : null); 
			while (node != null && node.nodeType != 1) {
				node = node.parentNode;
			}
			return node; 
		}});
		Object.defineProperty(MouseEvent.prototype, "toElement", {get:function () {
			var node = this.type == "mouseover" ? this.target : (this.type == "mouseout" ? this.relatedTarget : null); 
			while (node != null && node.nodeType != 1) {
				node = node.parentNode;
			}
			return node; 
		}});
		Object.defineProperty(MouseEvent.prototype, "offsetX", {get:function () {
			return this.clientX - this.target.getBoundingClientRect().left;
		}});
		Object.defineProperty(MouseEvent.prototype, "offsetY", {get:function () {
			return this.clientY - this.target.getBoundingClientRect().top;
		}});
		Object.defineProperty(KeyboardEvent.prototype, "keyCode", {get:function () {
			return this.which;
		}});
		Object.defineProperty(HTMLElement.prototype, "parentElement", {get:function() {
			return this.parentNode == this.ownerDocument ? null : this.parentNode;
        }});
		Object.defineProperty(HTMLElement.prototype, "innerText", {get:function() {
			return this.textContent;
        }});
	}
})();
