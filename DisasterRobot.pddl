(define (domain DisasterRobot)

(:requirements :strips :typing :durative-actions :fluents :equality)

(:types
  	    robot interactable - locatable
        person obstacle - interactable
        location
)

(:predicates
        (at ?l - locatable ?loc - location)
	  (adjacent ?l1 ?l2 - location)
	  (clear ?l1 - location)

        (canGoThrough ?o - obstacle)
        (canBePushed ?o - obstacle)
        (canGoOver ?o - obstacle)
        (canGoAround ?o - obstacle)
        (canDrillThrough ?o - obstacle)
        (notLoadBearing ?o - obstacle)

        (notBeingInteractedWith ?i - interactable)

        (noInjection ?p - person)
        (needsMark ?p - person)
        (marked ?p - person)

        (notBusy ?r - robot)


 )

(:functions
        (drillTime ?o - obstacle)
        (goOverTime ?o - obstacle)
        (goOntoTime ?o - obstacle)
        (goAroundTime ?o - obstacle)
        (goThroughTime ?o - obstacle)
        (goIntoTime ?o - obstacle)
        (pushTime ?o - obstacle)

        (injectionTime)
        (markTime)

	  (normalMove ?r - robot)
)


(:durative-action MARK-PERSON
       :parameters (?l - location ?p - person ?r - robot)
       :duration (= ?duration (markTime))
       :condition (and
			 (at start (notBusy ?r)) 
			 (at start (notBeingInteractedWith ?p))
                  (at start (needsMark ?p))
                  (at start (noInjection ?p))
                  (over all (at ?p ?l))
                  (over all (at ?r ?l)))
        :effect (and
                  (at start (not(notBusy ?r)))
                  (at start (not(notBeingInteractedWith ?p)))
                  (at end (not(needsMark?p)))
                  (at end (marked ?p))
                  (at end (notBeingInteractedWith ?p))
                  (at end (notBusy ?r))

		       )

)
(:durative-action INJECT-PERSON
        :parameters (?l - location ?p - person ?r - robot)
        :duration (= ?duration(injectionTime))
        :condition (and
			 (at start (notBusy ?r))
			 (at start (notBeingInteractedWith ?p))
                  (at start (needsMark?p))
                  (over all (at ?p ?l))
                  (over all (at ?r ?l)))
        :effect (and
                  (at start (not(notBusy ?r)))
                  (at start (not(notBeingInteractedWith ?p)))
                  (at end (not(needsMark?p)))
                  (at end (marked ?p))
                  (at end (notBeingInteractedWith ?p))
                  (at end (notBusy ?r))
		       )
)

(:durative-action MOVE
	:parameters (?l1 ?l2 - location ?r - robot)
	:duration( = ?duration (normalMove ?r))
	:condition(and
		    (at start (notBusy ?r))
		    (at start (at ?r ?l1))
		    (at start (adjacent ?l1 ?l2))
		    (at start (clear ?l2))
		     )
      :effect(and
		    (at start(not(notBusy ?r))) 
		    (at end (not(at ?r ?l1)))
		    (at end (at ?r ?l2)) 
		    (at end (notBusy ?r))
		     )

)

(:durative-action DRILL
	:parameters (?l1 ?l2 - location ?r - robot ?o - obstacle)
	:duration( = ?duration(drillTime ?o))
	:condition(and
		    (at start (notBusy ?r)) 
		    (at start (notBeingInteractedWith ?o))
		    (at start (notLoadBearing ?o))
		    (at start (at ?r ?l1))
		    (at start (adjacent ?l1 ?l2)) 
		    (at start (at ?o ?l2)) 
		    (at start (canDrillThrough ?o))
		    )
      :effect(and
		    (at start(not(notBusy ?r))) 
		    (at start (not(notBeingInteractedWith ?o)))
		    (at end (clear ?l2))
               (at end (notBeingInteractedWith ?o))
		    (at end (notBusy ?r))
		    )

)

(:durative-action PUSH-ASIDE 
	:parameters (?l1 ?l2 - location ?r - robot ?o - obstacle)
	:duration( = ?duration(pushTime ?o))
	:condition(and
		    (at start (notBusy ?r)) 
		    (at start (notBeingInteractedWith ?o))
		    (at start (at ?r ?l1))
		    (at start (adjacent ?l1 ?l2)) 
		    (at start (at ?o ?l2)) 
		    (at start (notLoadBearing ?o))
		    (at start (canBePushed ?o))
		    )
      :effect(and
		    (at start(not(notBusy ?r))) 
		    (at start (not(notBeingInteractedWith ?o)))
		    (at end (clear ?l2))
               (at end (notBeingInteractedWith ?o))
		    (at end (notBusy ?r))
		    )

)

(:durative-action MOVE-AROUND
	:parameters (?l1 ?l2 ?l3 - location ?r - robot ?o - obstacle)
	:duration( = ?duration(goAroundTime ?o)) 
	:condition(and
		    (at start (notBusy ?r)) 
		    (at start (notBeingInteractedWith ?o))
		    (at start (at ?r ?l1))
		    (at start (adjacent ?l1 ?l2)) 
		    (at start (adjacent ?l2 ?l3)) 
		    (at start (at ?o ?l2)) 
		    (at start (clear ?l3))
		    (at start (canGoAround ?o))
		    )
      :effect(and
		    (at start(not(notBusy ?r))) 
		    (at start (not(notBeingInteractedWith ?o)))
		    (at end (at ?r ?l3)) 
		    (at end (not(at ?r ?l1)))
               (at end (notBeingInteractedWith ?o))
		    (at end (notBusy ?r))
		    )

)

(:durative-action MOVE-INTO
	:parameters (?l1 ?l2 - location ?r - robot ?o - obstacle)
	:duration( = ?duration(goIntoTime ?o)) 
	:condition(and
		    (at start (notBusy ?r)) 
		    (at start (notBeingInteractedWith ?o))
		    (at start (at ?r ?l1))
		    (at start (adjacent ?l1 ?l2)) 
		    (at start (at ?o ?l2)) 
		    (at start (canGoThrough ?o))
		    )
      :effect(and
		    (at start(not(notBusy ?r))) 
		    (at start (not(notBeingInteractedWith ?o)))
		    (at end (at ?r ?l2)) 
		    (at end (not(at ?r ?l1)))
               (at end (notBeingInteractedWith ?o))
		    (at end (notBusy ?r))
		    )

)
(:durative-action MOVE-ONTO
	:parameters (?l1 ?l2 - location ?r - robot ?o - obstacle)
	:duration( = ?duration(goOntoTime ?o)) 
	:condition(and
		    (at start (notBusy ?r)) 
		    (at start (notBeingInteractedWith ?o))
		    (at start (at ?r ?l1))
		    (at start (adjacent ?l1 ?l2)) 
		    (at start (at ?o ?l2)) 
		    (at start (canGoOver ?o))
		    )
      :effect(and
		    (at start(not(notBusy ?r))) 
		    (at start (not(notBeingInteractedWith ?o)))
		    (at end (at ?r ?l2)) 
		    (at end (not(at ?r ?l1)))
               (at end (notBeingInteractedWith ?o))
		    (at end (notBusy ?r))
		    )

)

)

