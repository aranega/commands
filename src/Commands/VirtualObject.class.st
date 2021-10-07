Class {
	#name : #VirtualObject,
	#superclass : #Object,
	#instVars : [
		'wrappedObject',
		'valueDict',
		'commands'
	],
	#category : #'Commands-virtuals'
}

{ #category : #'instance creation' }
VirtualObject class >> from: anObject [
	^ self new object: anObject; yourself
]

{ #category : #accessing }
VirtualObject >> acquireCommandContextOf: anotherVirtualObject [

	commands := anotherVirtualObject commands
]

{ #category : #accessing }
VirtualObject >> asVirtualObject [
	^ self
]

{ #category : #accessing }
VirtualObject >> commands [
	^ commands
]

{ #category : #accessing }
VirtualObject >> doesNotUnderstand: aMessage [

	| selector slot |
	selector := aMessage selector withoutSuffix: ':'.
	wrappedObject ifNil: [ 
		aMessage arguments size = 1 ifTrue: [ 
			| value |
			value := (aMessage arguments at: 1) asVirtualObject.
			valueDict at: selector put: value.
			commands addAll: value commands.
			value acquireCommandContextOf: self.
			commands add: (SetCommand new
					 object: self;
					 value: value unproxyOrSelf;
					 slotName: selector;
					 yourself).
			^ self ].
		valueDict at: selector put: nil.
		^ nil ].

	[ slot := wrappedObject class slotNamed: selector ]
		on: SlotNotFound
		do: [ wrappedObject doesNotUnderstand: aMessage ].

	aMessage arguments size = 1 ifTrue: [ 
		| value |
		value := (aMessage arguments at: 1) asVirtualObject.
		commands addAll: value commands.
		value acquireCommandContextOf: self.
		valueDict at: selector put: value.
		commands add: (SetCommand new
				 object: wrappedObject;
				 value: value unproxyOrSelf;
				 slotName: selector;
				 yourself).
		^ self ].

	^ valueDict at: selector ifAbsentPut: [ slot read: wrappedObject ]
]

{ #category : #accessing }
VirtualObject >> initialize [

	valueDict := IdentityDictionary new.
	commands := OrderedCollection new.
]

{ #category : #accessing }
VirtualObject >> object [
	^ wrappedObject
]

{ #category : #accessing }
VirtualObject >> object: anObject [ 
	wrappedObject := anObject
	 
]

{ #category : #accessing }
VirtualObject >> unproxy [
	^ wrappedObject
]

{ #category : #accessing }
VirtualObject >> unproxyOrSelf [
	^ wrappedObject ifNil: [ self ]
]
