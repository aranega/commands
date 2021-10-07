Class {
	#name : #AddCommand,
	#superclass : #AbstractCommand,
	#instVars : [
		'value',
		'index'
	],
	#category : #'Commands-Core-core'
}

{ #category : #testing }
AddCommand >> canExecute [
	^ super canExecute "and: [ isManySlot  ]" 
]

{ #category : #testing }
AddCommand >> canUndo [
	| collection |
	collection := slot read: object.
	^ super canUndo and: [ collection includes: value ]
]

{ #category : #testing }
AddCommand >> doExecute [

	| collection |
	collection := slot read: object.
	index
		ifNil: [ 
			index := collection size + 1.
			collection add: value ]
		ifNotNil: [ collection add: value afterIndex: index ]
]

{ #category : #accessing }
AddCommand >> index [
	^ index
]

{ #category : #accessing }
AddCommand >> index: anIndex [
	index := anIndex
]

{ #category : #testing }
AddCommand >> redo [
	| collection |
	collection := slot read: object.
	collection add: value afterIndex: index - 1
]

{ #category : #testing }
AddCommand >> undo [

	| collection |
	collection := slot read: object.
	collection removeIndex: index
]

{ #category : #accessing }
AddCommand >> value [

	^ value
]

{ #category : #accessing }
AddCommand >> value: anObject [

	value := anObject
]
