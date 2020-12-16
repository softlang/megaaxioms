% This module is dedicated to testing inference rules
% that enable abbreviated writing forms.

:- include("../../src/common/discontiguous.pl").

% system and technology
technology(django).
system(polls_app).
uses(polls_app,django).

% a Django app folder is generated
% see "https://docs.djangoproject.com/en/3.1/ref/django-admin/#startapp"
folder("polls").
element_of("polls", django_app_folder_language).
fun_type(generate_app_folder,([],[django_app_folder_language])).
fun_apply(generate_app_folder,([],["polls"])).
implement(django,generate_app_folder).

% structure of an app
part_of("polls",polls_app).
file("polls/models.py").
file("polls/views.py").
part_of("polls/models.py","polls").
part_of("polls/views.py","polls").

% additional templates may be maintained in a templates folder.
file("templates/index.html").
part_of("templates/index.html",polls_app).

% languages
element_of("polls/models.py",python).
element_of("polls/views.py",python).
element_of("templates/index.html",django_template_html).
implement(django,django_template_html).
file("https://docs.djangoproject.com/en/3.1/ref/templates/language").
element_of("https://docs.djangoproject.com/en/3.1/ref/templates/language",html).
defines("https://docs.djangoproject.com/en/3.1/ref/templates/language",django_template_html).
conforms_to("templates/index.html","https://docs.djangoproject.com/en/3.1/ref/templates/language").

% concept model class
concept(django_model_class).
file("https://docs.djangoproject.com/en/3.1/ref/models/class").
element_of("https://docs.djangoproject.com/en/3.1/ref/models/class",html).
defines("https://docs.djangoproject.com/en/3.1/ref/models/class",django_model_class).
facilitates(django,django_model_class).
uses("polls/models.py",django_model_class).
complies_to("polls/models.py","https://docs.djangoproject.com/en/3.1/ref/models/class").

:- include("../../src/common/solasote.pl").
