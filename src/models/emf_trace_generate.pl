:- include("../../src/models/emf.pl").

% Traceability Recovery
% see fun_apply(generate_code, (["SimplePO.ecore", "SimplePO.genmodel"],["com.example.po"])).
trace([[genmodel_ref,ecore_ref,generated_code_ref]]).

% The trace consists of references
reference(genmodel_ref).
reference(ecore_ref).
reference(generated_code_ref).

% the references in the trace resolve to the following artifacts
resolves_to(ecore_ref,"SimplePO.ecore").
resolves_to(genmodel_ref,"SimplePO.genmodel").
resolves_to(generated_code_ref,"com.example.po").

% the references in the trace can be extracted from the generator model
encodes("SimplePO.genmodel",ecore_ref).
encodes("SimplePO.genmodel",generated_code_ref).
refers_to("SimplePO.genmodel","SimplePO.ecore").
refers_to("SimplePO.genmodel","com.example.po").

% A trace log includes the reference to a generator model.
file("generate_code.trace").
encodes("generate_code.trace",genmodel_ref).
encodes("generate_code.trace",ecore_ref).
encodes("generate_code.trace",generated_code_ref).
element_of("generate_code.trace",xml).
conforms_to("generate_code.trace","https://www.w3.org/XML/").
