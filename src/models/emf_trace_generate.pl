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
encodes("SimplePO.genmodel",genmodel_ref). % Every artifact encodes a reference to itself.
refers_to("SimplePO.genmodel","SimplePO.ecore").
refers_to("SimplePO.genmodel","com.example.po").
