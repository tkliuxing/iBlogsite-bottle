<%!
    import markdown2
    def md2(text):
        return markdown2.markdown(text, extras=['safe', 'code-friendly', 'fenced-code-blocks'])
    def gravatar(email, size):
        html = """<img class='gravatar' width='%(size)d' height='%(size)d' alt='' src='%(url)s'>"""
        url = Gravatar(email, secure=True, size=size).thumb
        return html % {'size': size, 'url': url}
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<title>${SITE_ENV.SITE_NAME} - <%block name="title"></%block></title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" href="${ SITE_ENV.STATIC_URL }bootstrap/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="${ SITE_ENV.STATIC_URL }css/main.css" type="text/css" />
	<link rel="stylesheet" href="${ SITE_ENV.STATIC_URL }css/jquery-ui-1.8.23.custom.css" type="text/css" />
	<script type="text/javascript" src="${ SITE_ENV.STATIC_URL }js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${ SITE_ENV.STATIC_URL }js/jquery-ui-1.8.23.custom.min.js"></script>
	<%block name="head">
	</%block>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="/">${SITE_ENV.SITE_NAME}</a>
				<div class="nav-collapse">
					<ul class="nav">
						<%block name="navbar">
						<li class="active">
							<a href="/">
								<i class="icon-home icon-white"></i>
								首页
							</a>
						</li>
						</%block>
					</ul>
					<form class="navbar-search pull-right">
						<input type="text" class="search-query" placeholder="Search">
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<%block name="container">
		</%block>
		<hr>
		<footer>
			<p>© iLab .co .ltd 2011-2012</p>
		</footer>
	</div>
</body>
</html>