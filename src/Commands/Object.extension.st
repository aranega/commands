Extension { #name : #Object }

{ #category : #'*Commands' }
Object >> asVirtualObject [

	| instances |
	instances := VirtualObject allInstances select: [ :each | 
		             each object == self ].
	^ instances
		  ifEmpty: [ VirtualObject from: self ]
		  ifNotEmpty: [ instances at: 1 ]
]
