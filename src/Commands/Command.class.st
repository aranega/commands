Class {
	#name : #Command,
	#superclass : #Object,
	#category : #'Commands-core'
}

{ #category : #testing }
Command >> canExecute [
	self subclassResponsibility 
]

{ #category : #testing }
Command >> canUndo [
	self subclassResponsibility 
]

{ #category : #testing }
Command >> execute [
	self subclassResponsibility 
]

{ #category : #testing }
Command >> redo [
	self subclassResponsibility 
]

{ #category : #testing }
Command >> undo [
	self subclassResponsibility 
]
