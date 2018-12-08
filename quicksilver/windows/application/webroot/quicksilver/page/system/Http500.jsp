<%@ page contentType="text/html; charset=UTF-8" %>
<% 
	response.setHeader("X-XSS-Protection", "1");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Internal Server Error</title>
		<style>
			*
			{
				box-sizing: border-box;
			}
			body
			{
				background-color: #eee;
			}
			.Screen
			{
				width: 560px;
				margin: 50px auto 0px auto;
				padding: 20px;
				border: 1px solid #655;
				border-radius: 24px;
				background-color: #fcc;
				position: relative;
			}
			.ScreenInner
			{
				padding: 30px 20px;
				border: 1px solid #c88;
				border-radius: 18px;
				background-color: #fff;
			}
			.Title
			{
				text-align: center;
				font-size: 80px;
				color: #f00;
			}
			.StatusCode
			{
				font-weight: bold;
				font-family:Tahoma,Helvetica;
			}
			.Description
			{
				margin-top: 20px;
				font-size: 28px;
				color: #888;
				font-family:Tahoma,Helvetica;
			}
			.Logo
			{
				position: absolute;
				left: 0px;
				bottom: 3px;
				font-size: 10px;
				width: 100%;
				text-align: center;
				font-family: Verdana;
				font-weight: bold;
				color: #fff;
				text-shadow: 0px 0px 2px #666;
			}
			.Logo::after
			{  
				content: "QUICKSILVER";  
				color: #ccc;  
				position: absolute;  
				left: 0px; 
				width: 100%;
				text-align: center;
				mask-image: linear-gradient(to bottom, #ccc 0%, transparent 50%, #ccc);
				-webkit-mask-image: linear-gradient(to bottom, #ccc 0%, transparent 50%, #ccc);
			}
			.BracketOuter
			{
				margin: 0px auto;
				width: 200px;
				height: 0;
				border-left: 50px solid transparent;
				border-right: 50px solid transparent;
				border-bottom: 50px solid #655;
			}
			.BracketInner
			{
				margin: 0px auto;
				width: 196px;
				height: 0;
				border-left: 50px solid transparent;
				border-right: 50px solid transparent;
				border-bottom: 50px solid #fcc;
				position: relative;
				top: -51px;
			}
		</style>
	</head>
	<body>
		<div class="Screen">
			<div class="ScreenInner">
				<div class="Title">
					<span>&#128563;</span>
					<span class="StatusCode">404</span>
					<span>&#128531;</span>
				</div>
				<div class="Description">
					The server cannot find the resource you are looking for.
				</div>
			</div>
			<div class="Logo">QUICKSILVER</div>
		</div>
		<div class="BracketOuter"></div>  
		<div class="BracketInner"></div>  
	</body>
</html>
