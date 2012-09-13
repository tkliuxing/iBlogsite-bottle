<%inherit file="base.mako"/>
<%block name="title">${blog.title}</%block>

<%block name="head">
	<link rel="stylesheet" href="${ SITE_ENV.STATIC_URL }css/codecolor/tango.css">
</%block>

<%block name="container">
<div class="row">
	<div class="span4">
		<div class="well">We are one</div>
	</div>
	<div class="span8">
		<div class="well">
			<div class="alert alert-success">
				<h5>${blog.title}</h5>
			</div>
			<div class="alert alert-message">
				${md2(blog.content)}
			</div>
			<div class="well note date">
					${gravatar(disc.email, 40)}
					<div class="date">
						<p>${blog.user}</p>
						<p>${blog.create_time}</p>
					</div>
					<a class="btn btn-success" href="#note">
						<i class="icon-comment"> </i>
						评论(${blog.discuess.count})
					</a>
			</div>
			<div class="well tags">
				% if not request.user.is_authenticated:
				<div class="universaltag">
					<ul class="universaltag ui-sortable">
						% for tag in blog.tags.all():
						<li class="tag frozen" pk="${tag.pk}">
							<a href="${tag.tag.get_absolute_url}">${tag.tag}</a>
						</li>
						% endfor
					</ul>
				</div>
				% endif
			</div>
		</div>
		<div class="well note" id="note" name="note">
			% for disc in blog.discuess.all():
			<div class="well">
				<div class="note-head">
					${gravatar(disc.email, 40)}
					<div>
						<p>${disc.name}</p>
						<p>${disc.create_time}</p>
					</div>
					% if request.user.is_authenticated():
					<a href="javascript:;" class="label label-important del-disc" style="float:right;" data-url="/blog/del/${disc.pk}/">
						<i class="icon-remove"></i>&nbsp;&nbsp;删除
					</a>
					% endif
				</div>
				<div class="note-body">
					${md2(disc.content)}
				</div>
			</div>
			% endfor
			<div class="form alert">
				<form action="." method="post">
					${form}
					<p>
						<button type="submit" class="btn btn-success">
							<i class="icon-ok"> </i>&nbsp;&nbsp;提交
						</button>
						<span class="label label-success" style="margin-left:140px;">Markdown is enabled!</span>
					</p>
				</form>
			</div>
		</div>
	</div>
</div>
</%block>

