:- include("../../src/common/discontiguous.pl").

% Artifact Instances
folder("org.eclipse.emf.ecore").              % package of the metametamodel.
folder("com.example.po").                     % package of the generated Java code
file("org.eclipse.emf.ecore.EObject.java").   % file of the metametamodel class EObject.
file("org.eclipse.emf.ecore.EPackage.java").  % file of the metametamodel class EPackage.
file("SimplePO.ecore").                       % file of the metamodel for purchase orders.
file("SimplePO.genmodel").                    % file of the generator model.
transient(christmas_order_object).            % transient instance of a purchase order metamodel.
file("christmas_simplepo.xmi").               % persisted instance of a purchase order metamodel.

% Languages interpreted as sets of artifacts
language(xml).                % the set of all XML artifacts
language(xmi).                % the set of all XMI artifacts
language(java).               % the set of all Java artifacts
language(java_package).       % the set of all Java packages
language(jvm_objects).        % the set of all objects at JVM runtime
language(ecore_java).         % the set of all Java artifacts derived from an Ecore model
language(ecore_xmi).          % the set of all Ecore models
language(genmodel_xmi).       % the set of all generator models
language(simplepo_xmi).       % the set of all purchase orders in XMI
language(ecore_java_package). % the set of all java packages based on an ecore model

% Set membership
element_of("org.eclipse.emf.ecore",java_package).
element_of("org.eclipse.emf.ecore.EObject.java",java).
element_of("org.eclipse.emf.ecore.EPackage.java",java).
element_of("SimplePO.ecore",ecore_xmi).
element_of("SimplePO.genmodel",genmodel_xmi).
element_of(christmas_order_object,jvm_objects).
element_of("christmas_simplepo.xmi",simplepo_xmi).
element_of("com.example.po",java_package).
element_of("com.example.po",ecore_java_package).

% Subset relationships
subset_of(ecore_xmi,xmi).
subset_of(simplepo_xmi,xmi).
subset_of(ecore_java,java).
subset_of(ecore_java_package,java_package).

technology(emf).
technology(emf_core).
technology(emf_persistence).
technology(emf_generator).
technology(javac).
technology(jvm).
system(simplepo_app).
system("simplepo_app.edit").

part_of(emf_core,emf).
part_of(emf_persistence,emf).
part_of("simplepo_app.edit",simplepo_app).

part_of("org.eclipse.emf.ecore",emf_core).
part_of("org.eclipse.emf.ecore.EObject.java","org.eclipse.emf.ecore").
part_of("org.eclipse.emf.ecore.EPackage.java","org.eclipse.emf.ecore").

part_of("SimplePO.ecore",simplepo_app).
part_of("SimplePO.genmodel", simplepo_app).
part_of("christmas_simplepo.xmi", simplepo_app).
part_of("SimplePO.ecore/PurchaseOrder","SimplePO.ecore").

% simplified conformance to basic languages
conforms_to("org.eclipse.emf.ecore","https://docs.oracle.com/javase/specs/").
conforms_to("org.eclipse.emf.ecore.EObject.java","https://docs.oracle.com/javase/specs/").
conforms_to("org.eclipse.emf.ecore.EPackage.java","https://docs.oracle.com/javase/specs/").
conforms_to("com.example.po","https://docs.oracle.com/javase/specs/").

%implementation of functions
implement(emf_persistence,save_model).
implement(emf_persistence,load_model).
implement(emf_generator,generate_code).

%implementation of languages
implement(emf_persistence,ecore_xmi).
implement(emf_persistence,genmodel_xmi).
implement(emf_generator,ecore_java).
implement(javac,java).
implement(javac,java_package).
implement(jvm,jvm_objects).

%Conformance scenario set up fragments
fragment("christmas_simplepo.xmi/order").
element_of("christmas_simplepo.xmi/order",purchase_order_xmi).
fragment("SimplePO.ecore/PurchaseOrder").
element_of("SimplePO.ecore/PurchaseOrder",eclass_xmi).
defines("SimplePO.ecore/PurchaseOrder",purchase_order_xmi).
fragment("christmas_simplepo.xmi/order/item[0]").
element_of("christmas_simplepo.xmi/order/item[0]",purchase_order_item_xmi).
fragment("christmas_simplepo.xmi/order/item[1]").
element_of("christmas_simplepo.xmi/order/item[1]",purchase_order_item_xmi).
fragment("SimplePO.ecore/Item").
element_of("SimplePO.ecore/Item",eclass_xmi).
defines("SimplePO.ecore/Item",purchase_order_item_xmi).
implement(simplepo_app,simplepo_xmi).
subset_of(purchase_order_xmi,xmi).
subset_of(purchase_order_item_xmi,xmi).
implement(simplepo_app,purchase_order_xmi).
implement(simplepo_app,purchase_order_item_xmi).
implement(emf,eclass_xmi).

%Traceable Conformance
conforms_to("christmas_simplepo.xmi","SimplePO.ecore").
part_of("christmas_simplepo.xmi/order","christmas_simplepo.xmi").
%part_of("SimplePO.ecore/PurchaseOrder","SimplePO.ecore").
conforms_to("christmas_simplepo.xmi/order","SimplePO.ecore/PurchaseOrder").
part_of("christmas_simplepo.xmi/order/item[0]","christmas_simplepo.xmi/order").
part_of("christmas_simplepo.xmi/order/item[1]","christmas_simplepo.xmi/order").
part_of("SimplePO.ecore/Item","SimplePO.ecore").
conforms_to("christmas_simplepo.xmi/order/item[0]","SimplePO.ecore/Item").
conforms_to("christmas_simplepo.xmi/order/item[1]","SimplePO.ecore/Item").

% Meta-Conformance
file(ecoremetamodel).
defines(ecoremetamodel,ecore_xmi).
element_of(ecoremetamodel,ecore_xmi).
conforms_to(ecoremetamodel,ecoremetamodel).
conforms_to("SimplePO.ecore",ecoremetamodel).
fragment(ecoremetamodel_eclass).
element_of(ecoremetamodel_eclass,eclass_xmi).
conforms_to(ecoremetamodel_eclass,ecoremetamodel_eclass).
part_of(ecoremetamodel_eclass,ecoremetamodel).
defines(ecoremetamodel_eclass,eclass_xmi).
conforms_to("SimplePO.ecore/PurchaseOrder",ecoremetamodel_eclass).
conforms_to("SimplePO.ecore/Item",ecoremetamodel_eclass).

%Correspondence scenario - Setup
transient("christmas_order_object.order").
part_of("christmas_order_object.order",christmas_order_object).
element_of("christmas_order_object.order",jvm_objects).
transient("christmas_order_object.order.item[0]").
part_of("christmas_order_object.order.item[0]","christmas_order_object.order").
element_of("christmas_order_object.order.item[0]",jvm_objects).
transient("christmas_order_object.order.item[1]").
part_of("christmas_order_object.order.item[1]","christmas_order_object.order").
element_of("christmas_order_object.order.item[1]",jvm_objects).
same_as("christmas_order_object.order.item[1]","christmas_simplepo.xmi/order/item[1]").

%Correspondence - Traceable
corresponds_to(christmas_order_object,"christmas_simplepo.xmi").
corresponds_to("christmas_order_object.order","christmas_simplepo.xmi/order").
corresponds_to("christmas_order_object.order.item[0]","christmas_simplepo.xmi/order/item[0]").
corresponds_to("christmas_order_object.order.item[1]","christmas_simplepo.xmi/order/item[1]").
same_as("christmas_order_object.order.item[0]","christmas_simplepo.xmi/order/item[0]").
same_as("christmas_order_object.order.item[1]","christmas_simplepo.xmi/order/item[1]").

%function declaration
function(save_model).
fun_type(save_model,([jvm_objects],[xmi])).

function(load_model).
fun_type(load_model,([xmi],[jvm_objects])).

function(generate_code).
fun_type(generate_code,([ecore_xmi,genmodel_xmi],[ecore_java_package])).
fun_type(generate_code,([eclass_xmi,genclass_xmi], [ecore_java])).

%function application
fun_apply(save_model,([christmas_order_object],["christmas_simplepo.xmi"])).
fun_apply(load_model,(["christmas_simplepo.xmi"],[christmas_order_object])).
fun_apply(generate_code,(["SimplePO.ecore", "SimplePO.genmodel"],["com.example.po"])).

% function application on fragment level
fragment("SimplePO.genmodel/Item").
part_of("SimplePO.genmodel/Item","SimplePO.genmodel").
element_of("SimplePO.genmodel/Item",genclass_xmi).
fragment("SimplePO.genmodel/PurchaseOrder").
part_of("SimplePO.genmodel/PurchaseOrder","SimplePO.genmodel").
element_of("SimplePO.genmodel/PurchaseOrder",genclass_xmi).
implement(emf,genclass_xmi).
file("Item.java").
element_of("Item.java",ecore_java).
file("PurchaseOrder.java").
element_of("PurchaseOrder.java",ecore_java).
fun_apply(save_model,(["christmas_order_object.order"],["christmas_simplepo.xmi/order"])).
fun_apply(save_model,(["christmas_order_object.order.item[0]"],["christmas_simplepo.xmi/order/item[0]"])).
fun_apply(save_model,(["christmas_order_object.order.item[1]"],["christmas_simplepo.xmi/order/item[1]"])).
fun_apply(generate_code,(["SimplePO.ecore/Item","SimplePO.genmodel/Item"],["Item.java"])).
fun_apply(generate_code,(["SimplePO.ecore/PurchaseOrder","SimplePO.genmodel/PurchaseOrder"],["PurchaseOrder.java"])).

%Triangle1
language(simplepo_xmi).
%element_of("christmas_simplepo.xmi",simplepo_xmi).
defines("SimplePO.ecore",simplepo_xmi).
%conforms_to("christmas_simplepo.xmi","SimplePO.ecore").

%Concepts
concept(xmiserialization).
defines("https://www.omg.org/spec/XMI/2.5.1/PDF",xmiserialization).
uses(simplepo_app,xmiserialization).
uses(simplepo_app,emf_persistence).
complies_to(simplepo_app,"https://www.omg.org/spec/XMI/2.5.1/PDF").
facilitates(emf_persistence,xmiserialization).
complies_to(emf_persistence,"https://www.omg.org/spec/XMI/2.5.1/PDF").

% simplified definition of basic languages
file("https://www.omg.org/spec/XMI/2.5.1/PDF").
language(pdf).
element_of("https://www.omg.org/spec/XMI/2.5.1/PDF",pdf).
file("https://www.iso.org/standard/63534.html").
element_of("https://www.iso.org/standard/63534.html",html).
defines("https://www.iso.org/standard/63534.html",pdf).
file("https://www.w3.org/XML/").
language(html).
element_of("https://www.w3.org/XML/",html).
defines("https://www.w3.org/XML/",xml).
defines("https://www.omg.org/spec/XMI/2.5.1/PDF",xmi).
file("https://html.spec.whatwg.org/").
element_of("https://html.spec.whatwg.org/",html).
defines("https://html.spec.whatwg.org/",html).
file("https://docs.oracle.com/javase/specs/").
element_of("https://docs.oracle.com/javase/specs/",html).
defines("https://docs.oracle.com/javase/specs/",java).
defines("https://docs.oracle.com/javase/specs/",java_package).

% The EMF module demonstrates the use of every axiom from the paper.
:- include("../../src/common/solasote.pl").
