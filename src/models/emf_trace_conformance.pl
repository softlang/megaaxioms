:- include("../../src/models/emf.pl").

% Traceability Recovery conforms_to("christmas_simplepo.xmi","SimplePO.ecore").
trace([
 [christmas_simplepo_ref,simplepo_ref],
 [christmas_order_ref,simplepo_order_ref],
 [christmas_item0_ref,simplepo_item_ref],
 [christmas_item1_ref,simplepo_item_ref]
 ]).

% The trace consists of references
reference(christmas_simplepo_ref).
reference(christmas_order_ref).
reference(christmas_item0_ref).
reference(christmas_item1_ref).
reference(simplepo_ref).
reference(simplepo_order_ref).
reference(simplepo_item_ref).
 
% References resolve to the following artifacts
resolves_to(christmas_simplepo_ref,"christmas_simplepo.xmi").
resolves_to(simplepo_ref,"SimplePO.ecore").

resolves_to(christmas_order_ref,"christmas_simplepo.xmi/PurchaseOrder").
resolves_to(simplepo_order_ref,"SimplePO.ecore/PurchaseOrder").

resolves_to(christmas_item0_ref,"christmas_simplepo.xmi/PurchaseOrder/item[0]").
resolves_to(christmas_item1_ref,"christmas_simplepo.xmi/PurchaseOrder/item[1]").
resolves_to(simplepo_item_ref,"SimplePO.ecore/Item").

% Refereces are encoded by the following artifacts
% We trace conformance. The christmas order is analyzed. Hence,
% the trace log encodes references to its parts.
% References to the metamodel are extracted and are hence encoded in parts of the
% christmas model.
encodes("christmas_simplepo.xmi",christmas_simplepo_ref).
encodes("christmas_simplepo.xmi",simplepo_ref).

encodes("christmas_simplepo.xmi/PurchaseOrder",christmas_order_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder",simplepo_order_ref).

encodes("christmas_simplepo.xmi/PurchaseOrder/item[0]",christmas_item0_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder/item[1]",christmas_item1_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder/item[0]",simplepo_item_ref).
encodes("christmas_simplepo.xmi/PurchaseOrder/item[1]",simplepo_item_ref).
