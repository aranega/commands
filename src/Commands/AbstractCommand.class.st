Class {
	#name : #AbstractCommand,
	#superclass : #Command,
	#instVars : [
		'executed',
		'object',
		'slot',
		'slotName'
	],
	#category : #'Commands-core'
}

{ #category : #testing }
AbstractCommand >> canExecute [

	slot := object class slotNamed: slotName asSymbol.
	slot ifNil: [ ^ false ].
	^ true
]

{ #category : #testing }
AbstractCommand >> canUndo [
	^ self isExecuted 
]

{ #category : #execution }
AbstractCommand >> doExecute [
	self subclassResponsibility 
]

{ #category : #execution }
AbstractCommand >> execute [
	executed := false.
	self doExecute.
	executed := true
]

{ #category : #execution }
AbstractCommand >> initialize [
	executed := false
]

{ #category : #execution }
AbstractCommand >> isExecuted [
	^ executed
]

{ #category : #accessing }
AbstractCommand >> object [

	^ object
]

{ #category : #accessing }
AbstractCommand >> object: anObject [

	object := anObject
]

{ #category : #accessing }
AbstractCommand >> slot [

	^ slot
]

{ #category : #accessing }
AbstractCommand >> slot: anObject [

	slot := anObject
]

{ #category : #accessing }
AbstractCommand >> slotName [

	^ slotName
]

{ #category : #accessing }
AbstractCommand >> slotName: anObject [

	slotName := anObject
]
