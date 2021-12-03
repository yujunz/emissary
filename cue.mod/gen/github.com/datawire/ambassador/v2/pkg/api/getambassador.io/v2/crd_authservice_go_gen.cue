// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/datawire/ambassador/v2/pkg/api/getambassador.io/v2

package v2

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

#AuthServiceIncludeBody: {
	// These aren't pointer types because they are required.
	// +kubebuilder:validation:Required
	max_bytes?: int @go(MaxBytes)

	// +kubebuilder:validation:Required
	allow_partial?: bool @go(AllowPartial)
}

// Why isn't this just an int??
#AuthServiceStatusOnError: {
	code?: int @go(Code)
}

// AuthServiceSpec defines the desired state of AuthService
#AuthServiceSpec: {
	ambassador_id?: #AmbassadorID @go(AmbassadorID)

	// +kubebuilder:validation:Required
	auth_service?: string               @go(AuthService)
	path_prefix?:  string               @go(PathPrefix)
	tls?:          null | #BoolOrString @go(TLS,*BoolOrString)

	// +kubebuilder:validation:Enum={"http","grpc"}
	proto?:      string                      @go(Proto)
	timeout_ms?: null | #MillisecondDuration @go(Timeout,*MillisecondDuration)
	allowed_request_headers?: [...string] @go(AllowedRequestHeaders,[]string)
	allowed_authorization_headers?: [...string] @go(AllowedAuthorizationHeaders,[]string)
	add_auth_headers?: {[string]: string} @go(AddAuthHeaders,map[string]string)
	allow_request_body?:  null | bool                      @go(AllowRequestBody,*bool)
	add_linkerd_headers?: null | bool                      @go(AddLinkerdHeaders,*bool)
	failure_mode_allow?:  null | bool                      @go(FailureModeAllow,*bool)
	include_body?:        null | #AuthServiceIncludeBody   @go(IncludeBody,*AuthServiceIncludeBody)
	status_on_error?:     null | #AuthServiceStatusOnError @go(StatusOnError,*AuthServiceStatusOnError)

	// +kubebuilder:validation:Enum={"v2","v3"}
	protocol_version?: string @go(ProtocolVersion)

	// +k8s:conversion-gen:rename=StatsName
	v3StatsName?: string @go(V3StatsName)

	// +k8s:conversion-gen:rename=CircuitBreakers
	v3CircuitBreakers?: [...null | #CircuitBreaker] @go(V3CircuitBreakers,[]*CircuitBreaker)
}

// AuthService is the Schema for the authservices API
//
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
#AuthService: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #AuthServiceSpec   @go(Spec)
}

// AuthServiceList contains a list of AuthServices.
//
// +kubebuilder:object:root=true
#AuthServiceList: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#AuthService] @go(Items,[]AuthService)
}
