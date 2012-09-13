<%inherit file="base.mako"/>
<%block name="title">首页</%block>

<%block name="head">
	<link rel="stylesheet" href="${ SITE_ENV.STATIC_URL }css/codecolor/tango.css">
</%block>

<%block name="container">
<div class="row">
	<div class="span8">
		% for blog in R['blogs']:
		<div class="well">
			<div class="alert alert-success">
				<h5>${blog.title}</h5>
			</div>
			<div class="alert alert-message">
				${md2(blog.content)}
			</div>
			<div class="well note date">
					${gravatar(blog.user.email, 40)}
					<div class="date">
						<p>${blog.user}</p>
						<p>${blog.create_time}</p>
					</div>
					<a class="btn btn-success" href="{{blog.get_absolute_url}}#note">
						<i class="icon-comment"> </i>
						评论(${blog.discuess.count})
					</a>
			</div>
			<div class="well tags">
				% if not request.user.is_authenticated():
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
		% else:
		<div class="well">
			<div class="alert alert-success">
				<h2>Hello world!</h2>
			</div>
			<div class="alert alert-message">
				This is new blog site.
			</div>
			<div class="alert alert-info"><strong>Someone</strong> at <strong>Today</strong></div>
		</div>
		% endfor
		<%doc>
		% if pagination.has_other_pages:
		<div class="pagination">
			<ul>
				% if pagination.has_previous:
				<li>
					<a href="./?p=${pagination.previous_page_number}">前一页</a>
				</li>
				% endif
				% for i in pagination.paginator.page_range:
				% if pagination.number == i:
				<li class="active">
					<a href="javascript:;">${i}</a>
				</li>
				% else:
				<li>
					<a href="./?p=${i}">${i}</a>
				</li>
				% endif
				% endfor
				% if pagination.has_next:
				<li>
					<a href="./?p=${pagination.next_page_number}">后一页</a>
				</li>
				% endif
			</ul>
		</div>
		% endif
		</%doc>
	</div>
	<div class="span4">
		<div class="well">We are one</div>
	</div>
</div>
</%block>