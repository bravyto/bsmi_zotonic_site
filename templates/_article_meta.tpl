<p class="article-meta">
<div class="row">
<div class="col-md-9 meta-data">
<div class="row">
	{% if m.rsc[id].author.id %}
	<div class="meta col-md-3">
		<span class="fa fa-user"></span> {{ m.rsc[id].author.title }}
	</div>
	{% endif %}
	{% if m.rsc[id].publication_start %}
	<div class="meta col-md-3">
		<span class="fa fa-clock-o"></span> {{ m.rsc[id].publication_start|date:"j F Y"}}
	</div>
	{% endif %}
	{% if m.rsc[id].o.subject.id %}
	<div class="meta col-md-3">
		<span class="fa fa-folder-open"></span> {{ m.rsc[id].o.subject.title }}
	</div>
	{% endif %}
	{% if m.rsc[id].author.id %}
	<!--<div class="meta col-md-3">
		<span class="fa fa-comment"></span> {{ m.rsc[id].o.subject[1].title }}
	</div>-->
	{% endif %}
</div>
</div>
<div class="col-md-3 read-more">
<a href="{{ m.rsc[id].page_url }}" class="btn btn-success btn-read-more">
	Selanjutnya
</a>
</div>
</div>
</p>
