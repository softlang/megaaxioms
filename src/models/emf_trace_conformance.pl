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

resolves_to(christmas_order_ref,"christmas_simplepo.xmi/order").
resolves_to(simplepo_order_ref,"SimplePO.ecore/PurchaseOrder").

resolves_to(christmas_item0_ref,"christmas_simplepo.xmi/order/item[0]").
resolves_to(christmas_item1_ref,"christmas_simplepo.xmi/order/item[1]").
resolves_to(simplepo_item_ref,"SimplePO.ecore/Item").

% Refereces are encoded by the following artifacts
% We trace conformance. The christmas order is analyzed. Hence,
% the trace log encodes references to its parts.
% References to the metamodel are extracted and are hence encoded in parts of the
% christmas model.
encodes("christmas_simplepo.xmi",christmas_simplepo_ref).
encodes("christmas_simplepo.xmi/.ecore_model",simplepo_ref).

encodes("christmas_simplepo.xmi/order",christmas_order_ref).
encodes("christmas_simplepo.xmi/order.eclass",simplepo_order_ref).

encodes("christmas_simplepo.xmi/order/item[0]",christmas_item0_ref).
encodes("christmas_simplepo.xmi/order/item[1]",christmas_item1_ref).
encodes("christmas_simplepo.xmi/order/item[0].eclass",simplepo_item_ref).
encodes("christmas_simplepo.xmi/order/item[1].eclass",simplepo_item_ref).

% fragment declaration
fragment("christmas_simplepo.xmi/.ecore_model").
part_of("christmas_simplepo.xmi/.ecore_model","christmas_simplepo.xmi").
element_of("christmas_simplepo.xmi/.ecore_model",ecore_reference_language).
fragment("christmas_simplepo.xmi/order.eclass").
part_of("christmas_simplepo.xmi/order.eclass","christmas_simplepo.xmi/order").
element_of("christmas_simplepo.xmi/order.eclass",eclass_reference_language).
fragment("christmas_simplepo.xmi/order/item[0].eclass").
part_of("christmas_simplepo.xmi/order/item[0].eclass","christmas_simplepo.xmi/order/item[0]").
element_of("christmas_simplepo.xmi/order/item[0].eclass",eclass_reference_language).
fragment("christmas_simplepo.xmi/order/item[1].eclass").
part_of("christmas_simplepo.xmi/order/item[1].eclass","christmas_simplepo.xmi/order/item[1]").
element_of("christmas_simplepo.xmi/order/item[1].eclass",eclass_reference_language).

% functions for reference resolution
function(resolve_ecore_reference).
implement(emf,resolve_ecore_reference).
fun_type(resolve_ecore_reference, ([ecore_reference_language],[ecore_xmi])).
fun_apply(resolve_ecore_reference, (["christmas_simplepo.xmi/.ecore_model"],["SimplePO.ecore"])).
refers_to("christmas_simplepo.xmi","SimplePO.ecore").

function(resolve_eclass_reference).
implement(emf,resolve_eclass_reference).
fun_type(resolve_eclass_reference,([eclass_reference_language],[eclass_xmi])).
fun_apply(resolve_eclass_reference,(["christmas_simplepo.xmi/order.eclass"],["SimplePO.ecore/PurchaseOrder"])).
fun_apply(resolve_eclass_reference,(["christmas_simplepo.xmi/order/item[0].eclass"],["SimplePO.ecore/Item"])).
fun_apply(resolve_eclass_reference,(["christmas_simplepo.xmi/order/item[1].eclass"],["SimplePO.ecore/Item"])).
refers_to("christmas_simplepo.xmi/order","SimplePO.ecore/PurchaseOrder").
refers_to("christmas_simplepo.xmi/order/item[0]","SimplePO.ecore/Item").
refers_to("christmas_simplepo.xmi/order/item[1]","SimplePO.ecore/Item").

% In any traceability recovery attempt for conformance,
% there exists a log of matched references.
file("conformance.trace").
element_of("conformance.trace",xml).
conforms_to("conformance.trace","https://www.w3.org/XML/").
encodes("conformance.trace",christmas_simplepo_ref).
encodes("conformance.trace",simplepo_ref).
encodes("conformance.trace",christmas_order_ref).
encodes("conformance.trace",simplepo_order_ref).
encodes("conformance.trace",christmas_item0_ref).
encodes("conformance.trace",christmas_item1_ref).
encodes("conformance.trace",simplepo_item_ref).


% reference fragments need to be added to objects in order to maintain idealized
% correspondence.
corresponds_to("christmas_order_object.nsURI", "nsURI=http://www.example.com/SimplePO").
same_as("christmas_order_object.nsURI", "nsURI=http://www.example.com/SimplePO").
fragment("christmas_order_object.nsURI").
part_of("christmas_order_object.nsURI",christmas_order_object).
element_of("christmas_order_object.nsURI",nsuri_reference_language).
fragment("nsURI=http://www.example.com/SimplePO").
part_of("nsURI=http://www.example.com/SimplePO","christmas_simplepo.xmi").
element_of("nsURI=http://www.example.com/SimplePO",nsuri_reference_language).
function(match_nsuri).
fun_type(match_nsuri,([nsuri_reference_language],[nsuri_reference_language])).
fun_apply(match_nsuri,(["christmas_order_object.nsURI"],["nsURI=http://www.example.com/SimplePO"])).
implement(emf,match_nsuri).

corresponds_to("christmas_order_object.order.class","christmas_simplepo.xmi/order.eclass").
same_as("christmas_order_object.order.class","christmas_simplepo.xmi/order.eclass").
fragment("christmas_order_object.order.class").
part_of("christmas_order_object.order.class","christmas_order_object.order").
element_of("christmas_order_object.order.class",eclass_reference_language).
fragment("christmas_simplepo.xmi/order.eclass").
part_of("christmas_simplepo.xmi/order.eclass","christmas_simplepo.xmi/order").
element_of("christmas_simplepo.xmi/order.eclass",eclass_reference_language).
same_as("christmas_order_object.order.class","christmas_simplepo.xmi/order.eclass").

corresponds_to("christmas_order_object.order.item[0].class","christmas_simplepo.xmi/order/item[0].eclass").
corresponds_to("christmas_order_object.order.item[0].class","christmas_simplepo.xmi/order/item[0].eclass").
same_as("christmas_order_object.order.item[0].class","christmas_simplepo.xmi/order/item[0].eclass").
same_as("christmas_order_object.order.item[0].class","christmas_simplepo.xmi/order/item[0].eclass").
fragment("christmas_order_object.order.item[0].class").
part_of("christmas_order_object.order.item[0].class","christmas_order_object.order.item[0]").
element_of("christmas_order_object.order.item[0].class",eclass_reference_language).
fragment("christmas_order_object.order.item[1].class").
part_of("christmas_order_object.order.item[1].class","christmas_order_object.order.item[1]").
element_of("christmas_order_object.order.item[1].class",eclass_reference_language).

implement(emf,ecore_reference_language).
implement(emf,nsuri_reference_language).
implement(emf,eclass_reference_language).

fun_type(resolve_eclass_reference,([eclass_reference_language],[ecore_java])).
fun_apply(resolve_eclass_reference,(["christmas_order_object.order.class"],["PurchaseOrder.java"])).
fun_apply(resolve_eclass_reference,(["christmas_order_object.order.item[0].class"],["Item.java"])).
fun_apply(resolve_eclass_reference,(["christmas_order_object.order.item[1].class"],["Item.java"])).
