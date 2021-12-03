// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/datawire/ambassador/v2/pkg/api/getambassador.io/v2

package v2

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// KubernetesServiceResolver tells Ambassador to use Kubernetes Service
// resources to resolve services. It actually has no spec other than the
// AmbassadorID.
#KubernetesServiceResolverSpec: {
	ambassador_id?: #AmbassadorID @go(AmbassadorID)
}

// KubernetesServiceResolver is the Schema for the kubernetesserviceresolver API
//
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
#KubernetesServiceResolver: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta             @go(ObjectMeta)
	spec?:     #KubernetesServiceResolverSpec @go(Spec)
}

// KubernetesServiceResolverList contains a list of KubernetesServiceResolvers.
//
// +kubebuilder:object:root=true
#KubernetesServiceResolverList: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#KubernetesServiceResolver] @go(Items,[]KubernetesServiceResolver)
}

// KubernetesEndpointResolver tells Ambassador to use Kubernetes Endpoints
// resources to resolve services. It actually has no spec other than the
// AmbassadorID.
#KubernetesEndpointResolverSpec: {
	ambassador_id?: #AmbassadorID @go(AmbassadorID)
}

// KubernetesEndpointResolver is the Schema for the kubernetesendpointresolver API
//
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
#KubernetesEndpointResolver: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta              @go(ObjectMeta)
	spec?:     #KubernetesEndpointResolverSpec @go(Spec)
}

// KubernetesEndpointResolverList contains a list of KubernetesEndpointResolvers.
//
// +kubebuilder:object:root=true
#KubernetesEndpointResolverList: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#KubernetesEndpointResolver] @go(Items,[]KubernetesEndpointResolver)
}

// ConsulResolver tells Ambassador to use Consul to resolve services. In addition
// to the AmbassadorID, it needs information about which Consul server and DC to
// use.
#ConsulResolverSpec: {
	ambassador_id?: #AmbassadorID @go(AmbassadorID)
	address?:       string        @go(Address)
	datacenter?:    string        @go(Datacenter)
}

// ConsulResolver is the Schema for the ConsulResolver API
//
// +kubebuilder:object:root=true
// +kubebuilder:storageversion
#ConsulResolver: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta  @go(ObjectMeta)
	spec?:     #ConsulResolverSpec @go(Spec)
}

// ConsulResolverList contains a list of ConsulResolvers.
//
// +kubebuilder:object:root=true
#ConsulResolverList: {
	TypeMeta:  metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#ConsulResolver] @go(Items,[]ConsulResolver)
}
