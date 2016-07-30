<%@page import="com.demo.common.model.Message"%>
<%@page import="com.demo.common.model.Blog"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../_mylayout.jsp"%>
<head>

<!-- meta -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet" href="../../css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/ionicons.min.css">
<link rel="stylesheet" href="../../css/pace.css">
<link rel="stylesheet" href="../../css/custom.css">

<!-- js -->
<script src="../../js/jquery-2.1.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/pace.min.js"></script>
<script src="../../js/modernizr.custom.js"></script>
</head>
<%
	Blog b = (Blog) request.getAttribute(myConstant.article);
	session.setAttribute(myConstant.currentArticle, b.getId());
%>
<head>
<p id=userMode>
	<%=sideStr2%></p>
<script type="text/javascript">
	var va=$("span#theUserMode").text();
	alert(va);
	$("p#userMode").click(function()
		{
			alert("function");	
			$("span.post-author").hide();
				$("span.post-category").hide();
		}
	);			
			//alert($("span#theUserMode").text());
			alert("hello");
	
</script>

</head>
<div class="content-body">
	<div class="container">
		<div class="row col-md-12">
			<main>
			<article class="post post-1">
				<header class="entry-header">
					<h1 class="entry-title">
						<a href="#"><%=b.getTitle()%></a>
					</h1>
					<div class="entry-meta">

						<span class="post-date"><a href="#"><time
									class="entry-date" datetime="2012-11-09T23:15:57+00:00"><%=b.getCreateTime()%></time></a></span>
						<span class="post-author"><a
							href="/blog/delete/<%=b.getId()%>">Delete</a></span> <span
							class="post-category"><a href="/blog/edit/<%=b.getId()%>">Edit</a></span>
							


					</div>
				</header>
				<div class="entry-content clearfix">
					<p></p>
					<textarea id="text-input" oninput="this.editor.update()" hidden><%=b.getContent()%></textarea>
					<div id="preview"></div>
					<script src="../../js/markdown.js"></script>
					<script>

						function Editor(input, preview) {
							this.update = function() {
								preview.innerHTML = markdown.toHTML(input.value);
							};
							input.editor = this;
							this.update();
						}
						var $ = function(id) {
							return document.getElementById(id);
						};
						new Editor($("text-input"), $("preview"));
					</script>
					<div class="read-more cl-effect-14"></div>
				</div>

			</article>
			</main>
		</div>

	</div>
</div>
<div class="messeage">
	<div class="container">
		<div class="row col-md-12">
			<form action="../../../message/send" method="post">
				<input hidden="hidden" name="message.blogid" value=<%=b.getId()%>>
				<input hidden="hidden" name="message.username" value=<%=sideStr2%>>
				<div>
					<a class="btn btn-default" id="triggleMe" role="button"
						data-toggle="collapse" href="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample"> Send a
						Message </a>

					<div class="collapse" id="collapseExample">
						<textarea class="form-control" rows="3" required="required"
							name="message.content"></textarea>

						<button class="btn btn-default col-md-offset-11" role="button"
							type="submit">Submit</button>
					</div>

					<br>

				</div>
			</form>
		</div>
		<br> <br>
		<div class="row col-md-12">
			<div class="panel panel-default contact-form ">
				<div class="panel-heading">
					<h2>Message</h2>
				</div>
				<div class="panel-body">
					<%
						List<Message> mes = (List<Message>) request.getAttribute(myConstant.message);
						if (mes != null) {
					%>
					<%
						for (int i = 0; i < mes.size(); i++) {
								Message ms = mes.get(i);
					%>
					<div class="panel panel-default">
						<div class="panel-heading"><%=ms.getUsername()%></div>
						<div class="panel-body"><%=ms.getContent()%></div>
					</div>
					<%
						}
						}
					%>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	
</script>

