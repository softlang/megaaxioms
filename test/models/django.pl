:- include("../../src/models/django.pl").
:- include("../../test/common/ok_type.pl").
:- include("../../test/common/ok_relation.pl").

% The Django model contains less hard coded "Prolog facts". We test that additional facts can be inferred.
:- begin_tests(infer).

test(language) :-
  language(python), language(django_template_html),!.

test(part_of) :-
  part_ofT("polls/models.py", polls_app),
  part_ofT("polls/views.py", polls_app), !.

test(implement) :-
  implement(django,django_app_folder_language).

:- end_tests(infer).
