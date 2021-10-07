Extension { #name : #Collection }

{ #category : #'*Commands-Core' }
Collection >> add: newObject afterIndex: anIndex [
	self subclassResponsibility
]

{ #category : #'*Commands-Core' }
Collection >> removeIndex: removedIndex [
	self subclassResponsibility 
]
