:- include("../../src/models/emf.pl").

% the instance model encodes a reference to the Ecore model
reference(simplepo_ref).
resolves_to(simplepo_ref,"SimplePO.ecore").
encodes("christmas_simplepo.xmi",simplepo_ref).

% the instance model encodes a reference to itself, because once we access
% the instance model, we know a qualified path to it.
reference(christmas_simplepo_ref).
resolves_to(christmas_simplepo_ref,"christmas_simplepo.xmi").
encodes("christmas_simplepo.xmi",christmas_simplepo_ref).

% Traceability Recovery conforms_to("christmas_simplepo.xmi","SimplePO.ecore").
trace([
 [christmas_simplepo_ref,simplepo_ref],
 [christmas_simplepo_order_ref,simplepo_order_ref],
 [christmas_simplepo_item0_ref,simplepo_item_ref],
 [christmas_simplepo_item1_ref,simplepo_item_ref]
 ]).

% The trace consists of references
reference(christmas_simplepo_order_ref).
reference(christmas_simplepo_item0_ref).
reference(christmas_simplepo_item1_ref).
reference(simplepo_order_ref).
reference(simplepo_item_ref).
 
% References resolve to the following artifacts
resolves_to(christmas_simplepo_order_ref,"christmas_simplepo.xmi/PurchaseOrder").
resolves_to(simplepo_order_ref,"SimplePO.ecore/PurchaseOrder").
resolves_to(christmas_simplepo_item0_ref,"christmas_simplepo.xmi/PurchaseOrder/item[0]").
resolves_to(christmas_simplepo_item1_ref,"christmas_simplepo.xmi/PurchaseOrder/item[1]").
resolves_to(simplepo_item_ref,"SimplePO.ecore/Item").

% Refereces are encoded by the following artifacts
encodes("christmas_simplepo.xmi/PurchaseOrder",christmas_simplepo_order_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder",simplepo_order_ref).

encodes("christmas_simplepo.xmi/PurchaseOrder/item[0]",christmas_simplepo_item0_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder/item[1]",christmas_simplepo_item1_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder/item[0]",simplepo_item_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder/item[1]",simplepo_item_ref).
