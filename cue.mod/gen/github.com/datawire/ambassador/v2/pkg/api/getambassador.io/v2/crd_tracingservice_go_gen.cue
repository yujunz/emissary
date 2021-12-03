// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/datawire/ambassador/v2/pkg/api/getambassador.io/v2

package v2

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

#TraceSampling: {
	client?:  null | int @go(Client,*int)
	random?:  null | int @go(Random,*int)
	overall?: null | int @go(Overall,*int)
}

#TraceConfig: {
	access_token_file?:  string @go(AccessTokenFile)
	collector_cluster?:  string @go(CollectorCluster)
	collector_endpoint?: string @go(CollectorEndpoint)

	// +kubebuilder:validation:Enum=HTTP_JSON_V1;HTTP_JSON;HTTP_PROTO
	collector_endpoint_version?: string      @go(CollectorEndpointVersion)
	collector_hostname?:         string      @go(CollectorHostname)
	trace_id_128bit?:            null | bool @go(TraceID128Bit,*bool)
	shared_span_context?:        null | bool @go(SharedSpanContext,*bool)
	service_name?:               string      @go(ServiceName)
}

// TracingServiceSpec defines the desired state of TracingService
#TracingServiceSpec: {
	ambassador_id?: #AmbassadorID @go(AmbassadorID)

	// +kubebuilder:validation:Enum={"lightstep","zipkin","datadog"}
	// +kubebuilder:validation:Required
	driver?: string @go(Driver)

	// +kubebuilder:validation:Required
	service?:  string                @go(Service)
	sampling?: null | #TraceSampling @go(Sampling,*TraceSampling)
	tag_headers?: [...string] @go(TagHeaders,[]string)
	config?: null | #TraceConfig @go(Config,*TraceConfig)

	// +k8s:conversion-gen:rename=StatsName
	v3StatsName?: string @go(V3StatsName)
}

// TracingService is the Schema for the tracingservices API
//
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
#TracingService: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta  @go(ObjectMeta)
	spec?:     #TracingServiceSpec @go(Spec)
}

// TracingServiceList contains a list of TracingServices.
//
// +kubebuilder:object:root=true
#TracingServiceList: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#TracingService] @go(Items,[]TracingService)
}