{% extends "base.tpl" %}

{% block title %}{{ m.rsc[id].title }}{% endblock %}

{% block carousel %}
	{% with m.search[{query  is_featured cat='article' sort='-publication_start' pagelen=m.config.site.pagelen.value}] as result %}
    <div class="carousel-wrapper">
      <div id="hero-carousel" class="carousel slide carousel-fade">
        <ol class="carousel-indicators">
	  {% for id in result %}
	  {% if forloop.counter0 == 0 %}
          <li data-target="#hero-carousel" data-slide-to="{{ forloop.counter0 }}" class="active"></li>
          {% else %}
          <li data-target="#hero-carousel" data-slide-to="{{ forloop.counter0 }}"></li>
	  {% endif %}
	  {% endfor %}
        </ol>
        <div class="carousel-inner">
	
	  {% for id in result %}
	  {% if forloop.counter == 1 %}
          <div class="item active">
<div class="carousel-detail">
<h1>{{ m.rsc[id].title }}</h1>
		<p class="summary">{{ id|summary }}</p>
</div>
			{% media m.rsc[id].media[1] crop alt=m.rsc[id].title %}
          </div>
          {% else %}
          <div class="item">
<div class="carousel-detail">
<h1>{{ m.rsc[id].title }}</h1>
		<p class="summary">{{ id|summary }}</p>
</div>
			{% media m.rsc[id].media[1] crop alt=m.rsc[id].title %}
          </div>
	  {% endif %}
	  {% endfor %}
	  
        </div>
        <a class="left carousel-control" href="#hero-carousel" data-slide="prev">
        </a>
        <a class="right carousel-control" href="#hero-carousel" data-slide="next">
        </a>
      </div>
    </div>
	{% endwith %}
{% endblock %}

{% block content %}
	{% if m.rsc[id].is_featured %}

		<h1>{{ m.rsc[id].title }}</h1>
		<p class="summary">{{ id|summary }}</p>
		{% for id in m.rsc[id].media %}
			{% include "_body_media.tpl" width=445 crop=1 align="block" %}
		{% endfor %}

	{% endif %}

	{% with m.search[{query cat='article' is_featured='false' sort='-publication_start' pagelen=m.config.site.pagelen.value}] as result %}

		<div id="list-articles">
			{% for id in result %}
					{% include "_article_summary.tpl" id=id %}
                                        {% if forloop.last!='true' %}
          				<hr class="article-hr"/>
                                        {% endif %}
			{% endfor %}
		</div>

		{% ifequal m.config.site.pagelen.value result|length %}
			{% wire id="more-results" action={moreresults result=result target="list-articles" template="_article_summary.tpl"} %}
			<p><a href="javascript:void(0);" id="more-results">More results...</a></p>
		{% endifequal %}

	{% endwith %}

{% endblock %}
