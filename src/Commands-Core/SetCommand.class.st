Class {
	#name : #SetCommand,
	#superclass : #AbstractCommand,
	#instVars : [
		'value',
		'previousValue'
	],
	#category : #'Commands-Core-core'
}

{ #category : #testing }
SetCommand >> canExecute [
	^ super canExecute "and: [ isNotManySlot  ]" 
]

{ #category : #testing }
SetCommand >> doExecute [

	previousValue := slot read: object.
	slot write: value to: object
]

{ #category : #accessing }
SetCommand >> previousValue [

	^ previousValue
]

{ #category : #accessing }
SetCommand >> previousValue: anObject [

	previousValue := anObject
]

{ #category : #testing }
SetCommand >> redo [
	slot write: value to: object
]

{ #category : #testing }
SetCommand >> undo [
	slot write: previousValue to: object
]

{ #category : #accessing }
SetCommand >> value [

	^ value
]

{ #category : #accessing }
SetCommand >> value: anObject [

	value := anObject
]
