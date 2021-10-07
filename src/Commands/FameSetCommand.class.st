Class {
	#name : #FameSetCommand,
	#superclass : #SetCommand,
	#category : #'Commands-core'
}

{ #category : #testing }
FameSetCommand >> canExecute [

	super canExecute ifFalse: [ ^ false ].
	^ (slot isFMRelationSlot and: [ slot isToOne ]) or: [ 
		  slot isFMRelationSlot not and: [ slot isFameSlot ] ]
]
