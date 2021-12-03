// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/datawire/ambassador/v2/pkg/api/getambassador.io/v2

package v2

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// DevPortalContentSpec defines the content origin
#DevPortalContentSpec: {
	url?:    string @go(URL)
	branch?: string @go(Branch)
	dir?:    string @go(Dir)
}

// DevPortalSelectorSpec is the selector for filtering mappings
// that are used in this DevPortal. They can be filtered by things like
// namespace, labels, etc...
#DevPortalSelectorSpec: {
	// MatchNamespaces is a list of namespaces that will be included in
	// this DevPortal.
	matchNamespaces?: [...string] @go(MatchNamespaces,[]string)

	// MatchLabels specifies the list of labels that must be present
	// in Mappings for being present in this DevPortal.
	matchLabels?: {[string]: string} @go(MatchLabels,map[string]string)
}

// DevPortalDocsSpec is a static documentation definition:
// instead of using a Selector for finding documentation for services,
// users can provide a static list of <service>:<URL> tuples. These services
// will be shown in the Dev Portal with the documentation obtained from
// this URL.
#DevPortalDocsSpec: {
	// Service is the service being documented
	service?: string @go(Service)

	// URL is the URL used for obtaining docs
	url?: string @go(URL)

	// Timeout specifies the amount of time devportal will wait
	// for the downstream service to report an openapi spec back
	timeout_ms?: null | #MillisecondDuration @go(Timeout,*MillisecondDuration)
}

// DevPortalSearchSpec allows configuration over search functionality for the DevPortal
#DevPortalSearchSpec: {
	enabled?: null | bool @go(Enabled,*bool)

	// Type of search.
	// "title-only" does a fuzzy search over openapi and page titles
	// "all-content" will fuzzy search over all openapi and page content.
	// "title-only" is the default.
	// warning:  using all-content may incur a larger memory footprint
	// +kubebuilder:validation:Enum={"title-only", "all-content"}
	type?: string @go(Type)
}

// DevPortalSpec defines the desired state of DevPortal
#DevPortalSpec: {
	ambassador_id?: #AmbassadorID @go(AmbassadorID)

	// Default must be true when this is the default DevPortal
	default?: null | bool @go(Default,*bool)

	// Content specifies where the content shown in the DevPortal come from
	content?: null | #DevPortalContentSpec @go(Content,*DevPortalContentSpec)

	// Docs is a static docs definition
	docs?: [...null | #DevPortalDocsSpec] @go(Docs,[]*DevPortalDocsSpec)

	// Selector is used for choosing what is shown in the DevPortal
	selector?: null | #DevPortalSelectorSpec @go(Selector,*DevPortalSelectorSpec)

	// Describes how to display "services" in the DevPortal. Default namespace.name
	// +kubebuilder:validation:Enum={"namespace.name", "name.prefix"}
	naming_scheme?: string                      @go(NamingScheme)
	search?:        null | #DevPortalSearchSpec @go(Search,*DevPortalSearchSpec)

	// Configures this DevPortal to use server definitions from the openAPI doc instead of
	// rewriting them based on the url used for the connection.
	preserve_servers?: null | bool @go(PreserveServers,*bool)
}

// DevPortal is the Schema for the DevPortals API
//
// DevPortal resources specify the `what` and `how` is shown in a DevPortal:
//
// * `what` is in a DevPortal can be controlled with
//   - a `selector`, that can be used for filtering `Mappings`.
//   - a `docs` listing of (services, url)
// * `how` is a pointer to some `contents` (a checkout of a Git repository
//   with go-templates/markdown/css).
//
// Multiple `DevPortal`s can exist in the cluster, and the Dev Portal server
// will show them at different endpoints. A `DevPortal` resource with a special
// name, `ambassador`, will be used for configuring the default Dev Portal
// (served at `/docs/` by default).
//
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
// +kubebuilder:resource:path=devportals,scope=Namespaced
#DevPortal: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #DevPortalSpec     @go(Spec)
}

// DevPortalList contains a list of DevPortals.
//
// +kubebuilder:object:root=true
#DevPortalList: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#DevPortal] @go(Items,[]DevPortal)
}